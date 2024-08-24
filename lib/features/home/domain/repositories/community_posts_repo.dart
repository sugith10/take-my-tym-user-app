import 'package:take_my_tym/core/model/app_post_model.dart';

abstract interface class CommunityPostsRepo {
  Future<List<PostModel>> latestbuyTymPosts({required String userId});
  Future<List<PostModel>> nearbyBuyTymPosts({
    required double latitude,
    required double longitude,
    required double range,
    required String userId,
  });
  Future<List<PostModel>> remoteBuyTymPosts({required String userId});
  Future<List<PostModel>> onsiteBuyTymPosts({required String userId});

  Future<List<PostModel>> sellTymPosts({required String userId});
}
