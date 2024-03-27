part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class LoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {
  final AuthUserModel userModel;
  const SignInSuccessState(this.userModel);
}

final class ErrorState extends SignInState {
  final String errorMessage;
  final String errorDescription;
  const ErrorState({
    required this.errorMessage,
    required this.errorDescription,
  });
}
