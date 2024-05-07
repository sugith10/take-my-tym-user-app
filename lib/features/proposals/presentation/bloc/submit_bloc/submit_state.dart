part of 'submit_bloc.dart';

sealed class SubmitState extends Equatable {
  const SubmitState();

  @override
  List<Object> get props => [];
}

final class SubmitLoading extends SubmitState {}

final class SubmitLoaded extends SubmitState {
  final PostModel postModel;
  final SubmitModel submitModel;
  const SubmitLoaded({
    required this.submitModel,
    required this.postModel,
  });
}

final class SubmitFail extends SubmitState {}