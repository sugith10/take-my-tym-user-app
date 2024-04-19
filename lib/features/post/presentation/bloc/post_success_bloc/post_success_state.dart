part of 'post_success_bloc.dart';

sealed class PostSuccessState extends Equatable {
  const PostSuccessState();
  
  @override
  List<Object> get props => [];
}

final class PostSuccessInitial extends PostSuccessState {}

final class PostSuccessCountDownState extends PostSuccessState {
  final int time;
  const PostSuccessCountDownState({required this.time});
  @override
  List<Object> get props => [time];
}

final class PostSuccessPageCloseState extends PostSuccessState {}
