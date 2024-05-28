part of 'success_page_bloc.dart';

sealed class SuccessPageState extends Equatable {
  const SuccessPageState();

  @override
  List<Object> get props => [];
}

final class SuccessPageTimeLeftState extends SuccessPageState {
  final int timeLeft;
  const SuccessPageTimeLeftState({required this.timeLeft});
  @override
  List<Object> get props => [timeLeft];
}

final class SuccessPageExistState extends SuccessPageState {}
