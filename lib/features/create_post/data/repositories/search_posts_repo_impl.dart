import 'dart:developer';
import 'package:take_my_tym/features/create_post/data/datasources/remote_data_source/search_posts_remote_data_source.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/create_post/domain/repositories/search_posts_repo.dart';

class SearchPostsRepoImpl implements SearchPostRepo {
  final SearchPostsRemoteData _searchRemoteData;
  
  SearchPostsRepoImpl(this._searchRemoteData);

  @override
  Future<List<PostModel>> searchBuyTymPost({required String searchQuery}) async {
    return await _searchRemoteData.searchBuyTymPost(search: searchQuery);
  }

  @override
  Future<List<PostModel>> searchSellTymPost({required String searchQuery}) async {
    return await _searchRemoteData.searchBuyTymPost(search: searchQuery);
  }
}
