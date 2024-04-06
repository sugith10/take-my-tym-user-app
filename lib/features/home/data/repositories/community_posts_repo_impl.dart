import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/data/datasources/remote/community_posts_remote_data.dart';
import 'package:take_my_tym/features/home/domain/repositories/community_posts_repo.dart';

final class CommunityPostsRepoImpl implements CommunityPostsRepo {
  final CommunityPostsRemoteData _communityPostsRemoteData;
  CommunityPostsRepoImpl(this._communityPostsRemoteData);

  @override
  Future<List<PostModel>> buyTymPosts() async{
    return await _communityPostsRemoteData.sellTymPosts();
  }

  @override
  Future<List<PostModel>> sellTymPosts() async {
    return await _communityPostsRemoteData.sellTymPosts();
  }
}