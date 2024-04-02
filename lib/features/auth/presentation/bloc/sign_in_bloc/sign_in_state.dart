part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {
  final AppUserModel userModel;
  const SignInSuccessState(this.userModel);
}

final class SignInErrorState extends SignInState {
  final String errorMessage;
  final String errorDescription;
  const SignInErrorState({
    required this.errorMessage,
    required this.errorDescription,
  });
}
