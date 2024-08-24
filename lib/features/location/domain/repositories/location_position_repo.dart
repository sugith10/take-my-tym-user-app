abstract interface class LocationPositionRepo {
  Future<Map<String, dynamic>> locationPosition({
    required String placeId,
  });
}