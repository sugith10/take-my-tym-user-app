abstract interface class DeletePostRepo{
  Future<void>deleteBuyTymPost({required String postId, required String userId});
  Future<void>deleteSellTymPost({required String postId, required String userId});
}