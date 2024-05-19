part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  final String email;
  final String password;
  final GlobalKey<FormState> formKey;
  const SignInEvent({
    required this.email,
    required this.password,
    required this.formKey,
  });

  @override
  List<Object> get props => [email, password];
}
