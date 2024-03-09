part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();
  
  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState{}

final class LoadingState extends SignInState{}

final class SignedSuccessState extends SignInState{
  final AuthUserModel userModel;
  const SignedSuccessState(this.userModel);
}

final class ErrorState extends SignInState{
  final String title;
  const ErrorState(this.title);
}
