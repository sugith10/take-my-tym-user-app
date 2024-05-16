part of 'forget_password_bloc.dart';

final class ForgetPasswordEvent extends Equatable{
  final String email;
 const  ForgetPasswordEvent({required this.email});
  
  @override

  List<Object?> get props => [email];
}
