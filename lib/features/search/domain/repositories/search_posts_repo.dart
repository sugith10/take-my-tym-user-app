import 'package:take_my_tym/core/model/app_post_model.dart';

abstract interface class SearchPostRepo {
  Future<List<PostModel>> searchBuyTymPost({required String searchQuery});
  Future<List<PostModel>> searchSellTymPost({required String searchQuery});
}
