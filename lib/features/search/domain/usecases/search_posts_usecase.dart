
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/search/domain/repositories/search_posts_repo.dart';

class SearchPostUseCase {
  final SearchPostRepo _searchPostRepo;

  SearchPostUseCase(this._searchPostRepo);

  Future<List<PostModel>> searchBuyTymPost(
      {required String searchQuery,required bool tymType}) async {
    return await _searchPostRepo.searchBuyTymPost(searchQuery: searchQuery,tymType:tymType );
  }

  Future<List<PostModel>> searchSellTymPost(
      {required String searchQuery, required bool tymType}) async {
    return await _searchPostRepo.searchSellTymPost(searchQuery: searchQuery,tymType: tymType);
  }
}
