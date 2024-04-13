import 'package:take_my_tym/features/location/domain/repositories/current_location_repo.dart';

final class CurrentLocationUseCase {


  final CurrentLocationRepo _currentLocationRepo;

  CurrentLocationUseCase(this._currentLocationRepo);

  Future<String> locationPositionName(
    double latitude,
    double longitud,
  ) async {
    return await _currentLocationRepo.locationPositionName(latitude, longitud);
  }
}
