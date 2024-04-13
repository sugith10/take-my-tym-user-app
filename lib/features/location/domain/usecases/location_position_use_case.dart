import 'package:take_my_tym/features/location/domain/repositories/location_position_repo.dart';

final class LocationPositionUseCase {
  final LocationPositionRepo _locationPositionRepo;
  LocationPositionUseCase(this._locationPositionRepo);

  Future<Map<String, dynamic>> fetchLocationPosition({
    required String placeId,
  }) async {
    return await _locationPositionRepo.locationPosition(placeId: placeId);
  }
}