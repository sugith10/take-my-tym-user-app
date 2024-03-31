import 'package:take_my_tym/features/post/data/models/post_model.dart';

abstract class CreatePostRepo {
  Future<void> createPostRepo({required PostModel postModel});
}
