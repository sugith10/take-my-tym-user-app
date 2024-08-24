import 'package:take_my_tym/features/view_post/domain/repositories/delete_post_repo.dart';

final class DeletePostUseCase{
  final DeletePostRepo _deletePostRepo;
  DeletePostUseCase(this._deletePostRepo);

  Future<void> deleteBuyTymPost({required String postId, required String userId})async{
    return _deletePostRepo.deleteBuyTymPost(postId: postId, userId: userId);
  }

  Future<void> deleteSellTymPost({required String postId, required String userId})async{
    return _deletePostRepo.deleteSellTymPost(postId: postId, userId: userId);
  }
  }