part of 'update_post_bloc.dart';

sealed class UpdatePostState {
  UpdatePostState();
}

final class UpdatePostInitial extends UpdatePostState {}

final class UpdatePostLoadingState extends UpdatePostState {}

final class UpdateFirstSuccessState extends UpdatePostState {}

final class UpdateFirstFailState extends UpdatePostState {
final AppErrorMsg error;

  UpdateFirstFailState({required this.error});
}

final class UpdateSecondFailState extends UpdatePostState {
  final String message;
  final String description;

  UpdateSecondFailState({required this.description, required this.message});
}

final class UpdatePostSuccessState extends UpdatePostState {
  final bool refreshType;
  final String uid;
  UpdatePostSuccessState({
    required this.refreshType,
    required this.uid,
  });
}

final class UpdatePostFailState extends UpdatePostState {
final AppErrorMsg error;

  UpdatePostFailState({required this.error});
}
