import 'package:take_my_tym/features/post/data/models/post_model.dart';

abstract class SearchPostRepo {
  //  Stream<List<PostModel>> searchBuyTymPost(
  //     {required String searchQuery});

  Future<Stream<List<PostModel>>> searchSellTymPost(
      {required String searchQuery});
}
