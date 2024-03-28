part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends SignInEvent {
  final String email;
  final String password;

  const LogInEvent({
    required this.email,
    required this.password,
  });
}

class PasswordReset extends SignInEvent {
  final String email;
  const PasswordReset({required this.email});
}
