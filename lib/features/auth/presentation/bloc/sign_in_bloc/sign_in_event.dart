part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInEvent extends SignInEvent {
  final String email;
  final String password;

  const AuthSignInEvent({
    required this.email,
    required this.password,
  });
}

class PasswordReset extends SignInEvent {
  final String email;
  const PasswordReset({required this.email});
}
