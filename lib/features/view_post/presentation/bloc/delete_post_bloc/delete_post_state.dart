part of 'delete_post_bloc.dart';

sealed class DeletePostState extends Equatable {
  const DeletePostState();

  @override
  List<Object> get props => [];
}

final class DeletePostInitial extends DeletePostState {}

final class DeletePostLoading extends DeletePostState {}

final class DeletPostSuccessState extends DeletePostState {
  final bool refreshType;
  final String uid;
  const DeletPostSuccessState({
    required this.refreshType,
    required this.uid,
  });
}

final class DeletPostFailState extends DeletePostState {
  final AppAlert appAlert;
  const DeletPostFailState({required this.appAlert});
}
