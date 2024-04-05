import 'package:take_my_tym/features/post/data/datasources/remote_data_source/search_posts_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/domain/repositories/search_posts_repo.dart';

final class SearchPostsRepoImpl implements SearchPostRepo {
  final SearchPostsRemoteData _searchRemoteData;
  SearchPostsRepoImpl(this._searchRemoteData);

  @override
  Future<Stream<List<PostModel>>> searchBuyTymPost(
      {required String searchQuery}) async {
    return await _searchRemoteData.searchBuyTymPost(search: searchQuery);
  }

  @override
  Future<Stream<List<PostModel>>> searchSellTymPost(
      {required String searchQuery}) async {
    return await _searchRemoteData.searchBuyTymPost(search: searchQuery);
  }
}
