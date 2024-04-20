import 'package:take_my_tym/core/model/app_post_model.dart';

abstract interface class CreatePostRepo {
  Future<bool> buyTymPost({required PostModel postModel});
   Future<bool> sellTymPost({required PostModel postModel});
}
