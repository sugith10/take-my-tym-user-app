import 'package:take_my_tym/features/create_post/data/datasources/remote_data_source/update_post_remote_data_source.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/create_post/domain/repositories/update_post_repo.dart';

final class UpdatePostRepoImpl implements UpdatePostRepo {
  final UpdatePostRemoteData _updatePostRemoteData;

  UpdatePostRepoImpl(this._updatePostRemoteData);

  @override
  Future<PostModel> updateBuyTymPost({required PostModel postModel}) async {
    return await _updatePostRemoteData.upadateBuyTymPosts(postModel: postModel);
  }

  @override
  Future<PostModel> updateSellTymPost({required PostModel postModel}) async {
    return await _updatePostRemoteData.upadateSellTymPosts(
        postModel: postModel);
  }
}