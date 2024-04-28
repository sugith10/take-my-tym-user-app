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
  final String message;
  final String description;
  CreateFirstFailState({
    required this.message,
    required this.description,
  });
}

final class CreateSecondFailState extends CreatePostState {
  final String message;
  final String description;
  CreateSecondFailState({
    required this.message,
    required this.description,
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

final class RemoteDataAddFailState extends CreatePostState {
  final String message;
  final String description;
  RemoteDataAddFailState({
    required this.message,
    required this.description,
  });
}
