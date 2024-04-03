import 'package:take_my_tym/features/post/data/datasources/remote_data_source/get_user_posts_data_source.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/domain/repositories/get_user_posts_repo.dart';

final class GetUserPostsRepoImp implements GetUserPostsRepo {
  final GetUserPostsRemoteData _getUserPostsDataSource;

  GetUserPostsRepoImp(this._getUserPostsDataSource);

  @override
  Future<List<PostModel>> buyTymPosts(String uid) async {
    return await _getUserPostsDataSource.userBuyTymPosts(uid);
  }
  
  @override
  Future<List<PostModel>> sellTymPosts(String uid)async {
   
    return await _getUserPostsDataSource.userSellTymPosts(uid);
  }

  
}
