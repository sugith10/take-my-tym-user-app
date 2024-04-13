part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitialState extends LocationState {}

class LocationLoadingState extends LocationState {}

class SearchLocationsResultsState extends LocationState {
  final List<AutoCompletePrediction> placePrdictions;

  const SearchLocationsResultsState({required this.placePrdictions});

  @override
  List<Object> get props => [placePrdictions];
}

class LocationPositionState extends LocationState {
  final double latitude;
  final double longitude;

  const LocationPositionState({
    required this.latitude,
    required this.longitude,
  });
}

class LocationTurnedOffState extends LocationState{

}

final class CurrentLocationState extends LocationState{
  
}
