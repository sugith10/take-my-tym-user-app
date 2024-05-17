part of 'sign_out_bloc.dart';

sealed class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => [];
}

final class SignOutInitial extends SignOutState {}

final class SignOutLoadingState extends SignOutState {}

final class SignOutFailState extends SignOutState {
  final AppAlert error;

  const SignOutFailState({
    required this.error,
  });
}

final class SignOutSuccessState extends SignOutState {}
