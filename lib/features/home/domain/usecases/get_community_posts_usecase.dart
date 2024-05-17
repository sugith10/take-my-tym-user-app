import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/domain/repositories/community_posts_repo.dart';

final class CommunityPostsUseCase {
  final CommunityPostsRepo _communityPostsRepo;

  CommunityPostsUseCase(this._communityPostsRepo);

  Future<List<PostModel>> latestbuyTymPosts({required String userId}) async {
    return await _communityPostsRepo.latestbuyTymPosts(userId: userId);
  }

  Future<List<PostModel>> remoteBuyTymPosts({required String userId}) async {
    return await _communityPostsRepo.remoteBuyTymPosts(userId: userId);
  }

  Future<List<PostModel>> onsiteBuyTymPosts({required String userId}) async {
    return await _communityPostsRepo.onsiteBuyTymPosts(userId: userId);
  }

  Future<List<PostModel>> sellTymPosts({required String userId}) async {
    return await _communityPostsRepo.sellTymPosts(userId: userId);
  }

  Future<List<PostModel>> nearbyBuyTymPosts({
    required double latitude,
    required double longitude,
    required double range,
    required String userId,
  }) async {
    return await _communityPostsRepo.nearbyBuyTymPosts(
      userId: userId,
        latitude: latitude, longitude: longitude, range: range);
  }
}
