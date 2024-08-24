part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends SignUpEvent {
  final String firstName;

  final String email;
  final String password;
   final  GlobalKey<FormState> formKey;
  const CreateUserEvent({
    required this.firstName,

    required this.email,
    required this.password,
     required this.formKey,
  });

  @override
  List<Object> get props => [firstName, email, password];
  }


