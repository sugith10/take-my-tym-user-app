part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {
  final UserModel userModel;
  final bool profileSetupComp;
  const SignInSuccessState(
      {required this.userModel, required this.profileSetupComp});
}

final class SignInErrorState extends SignInState {
final AppAlert  error;
  const SignInErrorState({
    required this.error
  });
}
