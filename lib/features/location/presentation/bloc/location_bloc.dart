import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/location/data/models/auto_complete_prediction.dart';
import 'package:take_my_tym/features/location/data/models/place_auto_complete_response.dart';
import 'package:take_my_tym/features/location/domain/usecases/location_position_use_case.dart';
import 'package:take_my_tym/features/location/domain/usecases/search_location_use_case.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  String? location;
  LocationBloc() : super(LocationInitialState()) {
    on<CurrentLocationEvent>((event, emit) async {
      emit(LocationLoadingState());
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      try {
        bool serviceEnabled;
        LocationPermission permission;

        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          emit(LocationTurnedOffState());
          return;
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            // Permissions are denied, next time you could try
            // requesting permissions again (this is also where
            // Android's shouldShowRequestPermissionRationale
            // returned true. According to Android guidelines
            // your App should show an explanatory UI now.

            return;
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.

          emit(LocationPermissionDeniedForeverState());
          return;
        }

        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);

        // final CurrentLocationUseCase currentLocationUseCase =
        //     GetIt.instance<CurrentLocationUseCase>();
        // String address = await currentLocationUseCase.locationPositionName(
        //   position.latitude,
        //   position.longitude,
        // );
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        String formattedPlaceName = '';

        for (var place in placemarks) {
          formattedPlaceName =
              '${place.locality}, ${place.administrativeArea}, ${place.country}';
          break;
        }

        formattedPlaceName = capitalizePlaces(formattedPlaceName);

        location = formattedPlaceName;
        emit(
          LocationResultState(
              latitude: position.latitude,
              longitude: position.longitude,
              placeName: formattedPlaceName),
        );
      } catch (e) {
        appLogger.e(e);
      }
    });

    on<SearchLocationsEvent>((event, emit) async {
      emit(LocationLoadingState());
      List<AutoCompletePrediction> placePrdictions = [];
      final SearchLocationUseCase searchLocationUseCase =
          GetIt.instance<SearchLocationUseCase>();
      try {
        String? response =
            await searchLocationUseCase.placeAutoComplete(query: event.query);

        if (response != null) {
          PlaceAutocompleteResponse result =
              PlaceAutocompleteResponse.parseAutocompleteResult(response);

          if (result.predictions != null) {
            placePrdictions = result.predictions!;
            emit(
              SearchLocationsResultsState(
                placePrdictions: placePrdictions,
              ),
            );
          }
        }
      } catch (e) {}
    });

    on<LocationPositonEvent>((event, emit) async {
      emit(LocationLoadingState());
      LocationPositionUseCase locationPositionUseCase =
          GetIt.instance<LocationPositionUseCase>();

      try {
        Map<String, dynamic> placePosition = await locationPositionUseCase
            .fetchLocationPosition(placeId: event.place.placeId!);
        double latitude = placePosition['latitude'];
        double longitude = placePosition['longitude'];

        location = event.place.description!;
        emit(
          LocationResultState(
            latitude: latitude,
            longitude: longitude,
            placeName: event.place.description!,
          ),
        );
      } catch (e) {}
    });
  }

  String capitalizePlaces(String place) {
    List<String> placeList = place.split(', ');

    for (int i = 0; i < placeList.length; i++) {
      // Correctly extract the first character and convert it to uppercase
      String firstChar = placeList[i][0].toUpperCase();

      if (firstChar != placeList[i][0]) {
        placeList[i] = firstChar + placeList[i].substring(1);
      }

      // Concatenate the capitalized first character with the remainder of the string
    }

    // Join the list back into a string, with each element separated by a comma and a space
    return placeList.join(', ');
  }
}
