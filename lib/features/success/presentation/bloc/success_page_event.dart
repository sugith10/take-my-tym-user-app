part of 'success_page_bloc.dart';

@immutable
sealed class SuccessPageEvent {}

class SuccessCountStartEvent extends SuccessPageEvent {
  final int timeLeft;
  SuccessCountStartEvent({required this.timeLeft});
}

class SuccessCountEndEvent extends SuccessPageEvent {}
