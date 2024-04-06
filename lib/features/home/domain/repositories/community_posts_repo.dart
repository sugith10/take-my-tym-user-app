import 'package:take_my_tym/core/model/app_post_model.dart';

abstract class CommunityPostsRepo {
  Future<List<PostModel>> buyTymPosts();
  Future<List<PostModel>> sellTymPosts();
}
