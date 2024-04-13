
import 'package:take_my_tym/features/location/data/datasources/search_location_remote.dart';
import 'package:take_my_tym/features/location/domain/repositories/search_location_repo.dart';

final class SearchLocationRepoImpl implements  SearchLocationRepo{
  final SerachLocationRemote _serachLocationRemote;
 
  SearchLocationRepoImpl(this._serachLocationRemote);
  @override
  Future<String?> autoCompleteLocation({required String query}) async{
   return _serachLocationRemote.autoCompleteLocation(query: query);
  }
}