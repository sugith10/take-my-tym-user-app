part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationResultState extends LocationState {
  final String placeName;
  final double latitude;
  final double longitude;

  const LocationResultState({
    required this.placeName,
    required this.latitude,
    required this.longitude,
  });
  
}

final class LocationInitialState extends LocationState {}

final class LocationLoadingState extends LocationState {}

final class SearchLocationsResultsState extends LocationState {
  final List<AutoCompletePrediction> placePrdictions;

  const SearchLocationsResultsState({required this.placePrdictions});

  @override
  List<Object> get props => [placePrdictions];
}

final class LocationPositionState extends LocationState {
  final double latitude;
  final double longitude;

  const LocationPositionState({
    required this.latitude,
    required this.longitude,
  });
}

final class LocationTurnedOffState extends LocationState {}

final class LocationPermissionDeniedForeverState extends LocationState {}
