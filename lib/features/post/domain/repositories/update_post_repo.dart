import 'package:take_my_tym/features/post/data/models/post_model.dart';

abstract class UpdatePostRepo {
  Future<PostModel> updateBuyTymPost({required PostModel postModel});
  Future<PostModel> updateSellTymPost({required PostModel postModel});
}
