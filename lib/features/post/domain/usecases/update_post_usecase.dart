import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/post/domain/repositories/update_post_repo.dart';

final class UpdatePostUseCase{

  final UpdatePostRepo _updatePostRepo;

  UpdatePostUseCase(this._updatePostRepo);
  Future<PostModel> updateBuyTymPost({required PostModel postModel})async{
   return await _updatePostRepo.updateBuyTymPost(postModel: postModel);
  }

   Future<PostModel> updateSellTymPost({required PostModel postModel})async{
   return await _updatePostRepo.updateSellTymPost(postModel: postModel);
  }
}