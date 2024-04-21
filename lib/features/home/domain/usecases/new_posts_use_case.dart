import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/domain/repositories/community_posts_repo.dart';

class NewBuyTymPostsUseCase {
  final CommunityPostsRepo _communityPostsRepo;
  NewBuyTymPostsUseCase(this._communityPostsRepo);

  Future<List<PostModel>> call()async{
    return await _communityPostsRepo.buyTymPosts();
  }
}