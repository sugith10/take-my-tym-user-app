import 'package:take_my_tym/core/model/app_post_model.dart';

abstract interface class GetUserPostsRepo{
  Future<List<PostModel>> buyTymPosts(String uid);
  Future<List<PostModel>> sellTymPosts(String uid);
}