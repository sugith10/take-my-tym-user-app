import '../../../../core/model/app_post_model.dart';
import '../bloc/create_post_bloc/create_post_bloc.dart';

final class CreatePostSecondPageArguments {
  final PostModel? postModel;
  final CreatePostBloc createPostBloc;

  CreatePostSecondPageArguments({
    required this.postModel,
    required this.createPostBloc,
  });
}
