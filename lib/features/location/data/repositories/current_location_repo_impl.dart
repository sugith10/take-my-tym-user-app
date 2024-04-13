import 'package:take_my_tym/features/location/data/datasources/location_position_name_remote.dart';
import 'package:take_my_tym/features/location/domain/repositories/current_location_repo.dart';

final class CurrentLocationRepoImpl implements CurrentLocationRepo {
  final CurrentLocationRemote _locationPostionNameRemote;
  CurrentLocationRepoImpl(this._locationPostionNameRemote);

  @override
  Future<String> locationPositionName(
    double latitude,
    double longitude,
  ) {
    return _locationPostionNameRemote.locationPositionName(
      latitude: latitude,
      longitude: longitude,
    );
  }
}