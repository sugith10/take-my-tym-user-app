import 'package:take_my_tym/features/view_post/data/datasources/delete_post_data_source.dart';
import 'package:take_my_tym/features/view_post/domain/repositories/delete_post_repo.dart';

final class DeletePostRepoImp implements DeletePostRepo {
  final DeletePostRemoteData _deletePostRemoteData;
  DeletePostRepoImp(this._deletePostRemoteData);

  @override
  Future<void> deleteBuyTymPost(
      {required String postId, required String userId}) {
    return _deletePostRemoteData.deletebBuyTymPost(
      postId: postId,
      userId: userId,
    );
  }

  @override
  Future<void> deleteSellTymPost(
      {required String postId, required String userId}) {
    //TODO:Change to deleteselltym
    return _deletePostRemoteData.deleteSellTymPost(postId: postId, userId: userId);

  }
}
