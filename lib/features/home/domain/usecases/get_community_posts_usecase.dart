import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/domain/repositories/community_posts_repo.dart';

final class CommunityPostsUseCase {
  final CommunityPostsRepo _communityPostsRepo;

  CommunityPostsUseCase(this._communityPostsRepo);

  Future<List<PostModel>> buyTymPosts() async {
    return await _communityPostsRepo.buyTymPosts();
  }

  Future<List<PostModel>> sellTymPosts() async {
    return await _communityPostsRepo.sellTymPosts();
  }
}