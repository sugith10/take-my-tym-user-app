import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/domain/repositories/community_posts_repo.dart';

class NearbyPostsUseCase {
  final CommunityPostsRepo _communityPostsRepo;
  NearbyPostsUseCase(this._communityPostsRepo);

  Future<List<PostModel>> call({
    required double latitude,
    required double longitude,
    required double range,
  }) async {
    return await _communityPostsRepo.nearbyBuyTymPosts(
      latitude: latitude,
      longitude: longitude,
      range: range,
    );
  }
}
