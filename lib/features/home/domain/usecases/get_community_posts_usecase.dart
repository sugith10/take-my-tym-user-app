import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/domain/repositories/community_posts_repo.dart';

final class CommunityPostsUseCase {
  final CommunityPostsRepo _communityPostsRepo;

  CommunityPostsUseCase(this._communityPostsRepo);

  Future<List<PostModel>> latestbuyTymPosts() async {
    return await _communityPostsRepo.latestbuyTymPosts();
  }

    Future<List<PostModel>> remoteBuyTymPosts() async {
    return await _communityPostsRepo.remoteBuyTymPosts();
  }

    Future<List<PostModel>> onsiteBuyTymPosts() async {
    return await _communityPostsRepo.onsiteBuyTymPosts();
  }

  Future<List<PostModel>> sellTymPosts() async {
    return await _communityPostsRepo.sellTymPosts();
  }

  Future<List<PostModel>> nearbyBuyTymPosts({
    required double latitude,
    required double longitude,
    required double range,
  }) async {
    return await _communityPostsRepo.nearbyBuyTymPosts(
        latitude: latitude, longitude: longitude, range: range);
  }
}