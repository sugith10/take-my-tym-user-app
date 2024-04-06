import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/create_post/domain/repositories/get_user_posts_repo.dart';

final class GetUserPostsUseCase {
  final GetUserPostsRepo _getUserPostRepo;

  GetUserPostsUseCase(this._getUserPostRepo);

  Future<List<PostModel>> getBuyTymPosts({required String userId}) async {
    return await _getUserPostRepo.buyTymPosts(userId);
  }

  Future<List<PostModel>> getSellTymPosts({required String userId}) async{
    return await _getUserPostRepo.sellTymPosts(userId);
  }
}
