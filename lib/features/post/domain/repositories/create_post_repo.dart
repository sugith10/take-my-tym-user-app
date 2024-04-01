import 'package:take_my_tym/features/post/data/models/post_model.dart';

abstract class CreatePostRepo {
  Future<bool> buyTymPost({required PostModel postModel});
   Future<bool> sellTymPost({required PostModel postModel});
}
