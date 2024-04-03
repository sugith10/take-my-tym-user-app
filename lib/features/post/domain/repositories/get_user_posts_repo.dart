import 'package:take_my_tym/features/post/data/models/post_model.dart';

abstract class GetUserPostsRepo{
  Future<List<PostModel>> buyTymPosts(String uid);
  Future<List<PostModel>> sellTymPosts(String uid);
}