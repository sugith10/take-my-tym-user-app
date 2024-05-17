import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/data/datasources/remote/community_posts_remote_data.dart';
import 'package:take_my_tym/features/home/domain/repositories/community_posts_repo.dart';

final class CommunityPostsRepoImpl implements CommunityPostsRepo {
  final CommunityPostsRemoteData _communityPostsRemoteData;
  CommunityPostsRepoImpl(this._communityPostsRemoteData);

  @override
  Future<List<PostModel>> latestbuyTymPosts({required String userId}) async {
    return await _communityPostsRemoteData.latestbuyTymPosts(uid: userId);
  }

  @override
  Future<List<PostModel>> nearbyBuyTymPosts({
    required double latitude,
    required double longitude,
    required double range,
    required String userId,
  }) async {
    return await _communityPostsRemoteData.getNearbyBuyTymPosts(
        latitude: latitude, longitude: latitude, range: range);
  }

  @override
  Future<List<PostModel>> onsiteBuyTymPosts({required String userId}) async {
    return await _communityPostsRemoteData.getOnsiteBuyTymPosts(uid: userId);
  }

  @override
  Future<List<PostModel>> remoteBuyTymPosts({required String userId}) async {
    return await _communityPostsRemoteData.getRemoteBuyTymPosts(uid: userId);
  }

  @override
  Future<List<PostModel>> sellTymPosts({required String userId}) async {
    return await _communityPostsRemoteData.sellTymPosts();
  }
}
