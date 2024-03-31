import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/domain/repositories/create_post_repo.dart';

class CreatePostUseCase{
  final CreatePostRepo _createPostRepo;

  CreatePostUseCase(this._createPostRepo);

  Future<void> createPost({required PostModel postModel})async{
    await _createPostRepo.createPostRepo(postModel: postModel);
  }
}