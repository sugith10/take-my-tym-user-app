abstract interface class CurrentLocationRepo {
  Future<String> locationPositionName(double latitude, double longitude);

}
