import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/secret/google_map_api_key.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/location/data/datasources/get_location_name.dart';
import 'package:take_my_tym/features/location/data/models/auto_complete_prediction.dart';
import 'package:take_my_tym/features/location/data/models/place_auto_complete_response.dart';
import 'package:take_my_tym/features/location/data/datasources/location_data.dart';
import 'package:take_my_tym/features/location/presentation/widgets/google_text.dart';
import 'package:take_my_tym/features/location/presentation/widgets/location_divider.dart';
import 'package:take_my_tym/features/location/presentation/widgets/location_list_tile_widget.dart';
import 'package:take_my_tym/features/location/presentation/widgets/location_page_appbar.dart';
import 'package:geocoding/geocoding.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  final TextEditingController _locationController = TextEditingController();

  List<AutoCompletePrediction> placePrdictions = [];

  void placeAutocomplate(String query) async {
    log("on placeAutoComplate");
    Uri uri =
        Uri.https("maps.googleapis.com", "maps/api/place/autocomplete/json", {
      "input": query,
      "key": googleMapApiKey,
    });
    String? response = await LocationData().fetchUrl(uri);

    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePrdictions = result.predictions!;
        });
      }
    }
  }

  void getLocation(BuildContext context) async {
    {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      try {
        Position position = await _determinePosition(context);
        log("Location:-  $position");

        String address =
            await getLocationName(position.latitude, position.longitude);
        log("Address: $address");

        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        log("place: $placemarks.toString()");
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LocationPageAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(MyAppPadding.homePadding),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _locationController,
              onChanged: (value) {
                placeAutocomplate(value);
                // searchBloc.add(SearchBuyTymPost(searchQuery: value));
              },
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              cursorColor: MyAppDarkColor().primaryText,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    IconlyLight.search,
                    color: Colors.white,
                  ),
                ),
                filled: true,
                fillColor: MyAppDarkColor().fillColor,
                hintText: 'Search for area...',
                hintStyle: Theme.of(context).textTheme.labelLarge,
              ),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const LocationDivider(),
          Padding(
            padding: const EdgeInsets.all(MyAppPadding.homePadding),
            child: ElevatedButton(
              onPressed: () {
                getLocation(context);
                // placeAutocomplate("Dubai");
              },
              style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                      Size(double.infinity, kToolbarHeight))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: MyAppDarkColor().danger,
                  ),
                  const SizedBox(width: 10),
                  const Text("Use current location")
                ],
              ),
            ),
          ),
          const LocationDivider(),
          Expanded(
            child: ListView.builder(
              itemCount: placePrdictions.length,
              itemBuilder: (context, index) {
                return LocationListTile(
                  callback: () {},
                  location: placePrdictions[index].description!,
                );
              },
            ),
          ),
          const PoweredByGoogleText()
        ],
      ),
    );
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child: Text(
          'Location Services Disabled',
          style: TextStyle(color: MyAppDarkColor().danger),
        )),
        content: const Text(
          'Please enable location services to use this feature.',
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Geolocator.openLocationSettings(); // Open location settings
                  Navigator.pop(context);
                },
                child: const Text('Enable Location'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return Future.error('Location services are disabled.');
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
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
}
