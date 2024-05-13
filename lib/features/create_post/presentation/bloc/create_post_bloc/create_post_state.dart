part of 'create_post_bloc.dart';

sealed class CreatePostState {
  const CreatePostState();
}

final class CreatePostInitial extends CreatePostState {}

final class CreatPostLoadingState extends CreatePostState {}

final class CreateFirstSuccessState extends CreatePostState {
  CreateFirstSuccessState();
}

final class CreateFirstFailState extends CreatePostState {
  final AppErrorMsg error;
  CreateFirstFailState({
    required this.error,
  });
}

final class CreateSecondFailState extends CreatePostState {
  final AppErrorMsg error;
  CreateSecondFailState({
    required this.error,
  });
}

final class CreatePostSuccessState extends CreatePostState {
  final bool refreshType;
  final String uid;
  CreatePostSuccessState({
    required this.refreshType,
    required this.uid,
  });
}

final class UpdatePostSuccessState extends CreatePostState {
  final bool refreshType;
  final String uid;
  UpdatePostSuccessState({
    required this.refreshType,
    required this.uid,
  });
}

final class RemoteDataAddFailState extends CreatePostState {
  final AppErrorMsg error;
  RemoteDataAddFailState({
required this.error,
  });
}
