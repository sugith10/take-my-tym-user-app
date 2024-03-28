part of 'sign_out_bloc_bloc.dart';

sealed class SignOutBlocState extends Equatable {
  const SignOutBlocState();
  
  @override
  List<Object> get props => [];
}

final class SignOutBlocInitial extends SignOutBlocState {}
