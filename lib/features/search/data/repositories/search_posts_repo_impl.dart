import 'package:take_my_tym/features/search/data/datasources/remote/search_posts_remote_data_source.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/search/domain/repositories/search_posts_repo.dart';

class SearchPostsRepoImpl implements SearchPostRepo {
  final SearchPostsRemoteData _searchRemoteData;

  SearchPostsRepoImpl(this._searchRemoteData);

  @override
  Future<List<PostModel>> searchBuyTymPost(
      {required String searchQuery, required bool tymType}) async {
    return await _searchRemoteData.searchBuyTymPost(
        search: searchQuery, tymType: tymType);
  }

  @override
  Future<List<PostModel>> searchSellTymPost(
      {required String searchQuery, required bool tymType}) async {
    return await _searchRemoteData.searchBuyTymPost(
        search: searchQuery, tymType: tymType);
  }
}
