part of 'submit_bloc.dart';

sealed class SubmitEvent extends Equatable {
  const SubmitEvent();

  @override
  List<Object> get props => [];
}

final class SubmitDetailsEvent extends SubmitEvent {
  final SubmitModel submitModel;
  const SubmitDetailsEvent({required this.submitModel});
}
