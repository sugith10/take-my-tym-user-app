import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/create_post/domain/repositories/create_post_repo.dart';

class CreatePostUseCase{
  final CreatePostRepo _createPostRepo;

  CreatePostUseCase(this._createPostRepo);

  Future<bool> buyTymPost({required PostModel postModel})async{
   return await  _createPostRepo.buyTymPost(postModel: postModel);
  }

  Future<bool> sellTymPost({required PostModel postModel})async{
   return await _createPostRepo.sellTymPost(postModel: postModel);
  }
}