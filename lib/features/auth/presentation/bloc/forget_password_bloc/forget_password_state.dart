part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState {
  const ForgetPasswordState();
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordFailState extends ForgetPasswordState {
  final String message;
  final String description;
  ForgetPasswordFailState({required this.message, required this.description});
}

final class ForgetPasswordLoadingState extends ForgetPasswordState {}

final class ForgetPasswordSuccessState extends ForgetPasswordState {
}
