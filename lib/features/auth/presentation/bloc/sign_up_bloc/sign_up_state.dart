part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class LoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {
  final AuthUserModel userModel;
  const SignUpSuccessState(this.userModel);
}

final class SignUpErrorState extends SignUpState{
  final String title;
  final String message;
  const SignUpErrorState({required this.title,required this.message,});
}
