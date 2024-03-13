// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class CreateUser extends SignUpEvent {
  final String firstName;
  final String lastName; 
  final String email;
  final String password;

  const CreateUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
