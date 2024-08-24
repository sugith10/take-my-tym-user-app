import 'package:take_my_tym/features/location/domain/repositories/search_location_repo.dart';

final class SearchLocationUseCase {
  final SearchLocationRepo _searchLocationRepo;

  SearchLocationUseCase(this._searchLocationRepo);

  Future<String?> placeAutoComplete({required query}) async {
    return _searchLocationRepo.autoCompleteLocation(query: query);
  }
}
