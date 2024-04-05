import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/domain/repositories/search_posts_repo.dart';

final class SearchPostUseCase {
   SearchPostRepo _searchPostRepo;
  SearchPostUseCase(this._searchPostRepo);
  // Future<Stream<List<PostModel>>> searchBuyTymPost(
  //     {required String searchQuery}) async {
  //   return await _searchPostRepo.searchBuyTymPost(searchQuery: searchQuery);
  // }
   Future<Stream<List<PostModel>>> searchSellTymPost(
      {required String searchQuery}) async {
    return await _searchPostRepo.searchSellTymPost(searchQuery: searchQuery);
  }
}
