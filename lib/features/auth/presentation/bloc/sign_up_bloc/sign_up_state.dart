part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {
  final AppUserModel userModel;
  const SignUpSuccessState(this.userModel);
}

final class SignUpFailState extends SignUpState {
  final String title;
  final String message;
  const SignUpFailState({
    required this.title,
    required this.message,
  });
}