import 'package:take_my_tym/features/location/data/datasources/location_position_remote.dart';
import 'package:take_my_tym/features/location/domain/repositories/location_position_repo.dart';

final class LocationPositionRepoImpl implements LocationPositionRepo {
  final LocationPositionRemote _locationPositionRemote;

  const LocationPositionRepoImpl(this._locationPositionRemote);
  @override
  Future<Map<String, dynamic>> locationPosition(
      {required String placeId}) async {
    return await _locationPositionRemote.fetchLocationPosition(
        placeId: placeId);
  }
}
