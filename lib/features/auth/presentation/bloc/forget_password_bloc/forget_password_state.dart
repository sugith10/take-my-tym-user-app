part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState {
  const ForgetPasswordState();
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordFailState extends ForgetPasswordState {
final AppErrorMsg error;
  ForgetPasswordFailState({required this.error,});
}

final class ForgetPasswordLoadingState extends ForgetPasswordState {}

final class ForgetPasswordSuccessState extends ForgetPasswordState {
}
