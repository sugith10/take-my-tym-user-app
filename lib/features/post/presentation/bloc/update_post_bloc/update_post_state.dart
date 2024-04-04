part of 'update_post_bloc.dart';

sealed class UpdatePostState extends Equatable {
  const UpdatePostState();

  @override
  List<Object> get props => [];
}

final class UpdatePostInitial extends UpdatePostState {}

final class UpdatePostLoadingState extends UpdatePostState {}

final class UpdatePostSuccessState extends UpdatePostState {
  final PostModel postModel;
  const UpdatePostSuccessState({required this.postModel});
}

final class UpdatePostFailState extends UpdatePostState {
  final String message;
  final String description;

  const UpdatePostFailState({required this.message, required this.description});
}
