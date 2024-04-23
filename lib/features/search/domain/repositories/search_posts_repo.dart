import 'package:take_my_tym/core/model/app_post_model.dart';

abstract interface class SearchPostRepo {
  Future<List<PostModel>> searchBuyTymPost(
      {required String searchQuery, required bool tymType});
  Future<List<PostModel>> searchSellTymPost(
      {required String searchQuery, required bool tymType});
}
