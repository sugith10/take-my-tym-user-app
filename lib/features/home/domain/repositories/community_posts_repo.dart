import 'package:take_my_tym/core/model/app_post_model.dart';

abstract interface class CommunityPostsRepo {
  Future<List<PostModel>> latestbuyTymPosts();
  Future<List<PostModel>> nearbyBuyTymPosts({
    required double latitude,
    required double longitude,
    required double range,
  });
  Future<List<PostModel>> remoteBuyTymPosts();
  Future<List<PostModel>> onsiteBuyTymPosts();

  Future<List<PostModel>> sellTymPosts();
}
