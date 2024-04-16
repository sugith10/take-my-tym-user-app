part of 'verify_user_bloc.dart';

sealed class VerifyUserState extends Equatable {
  const VerifyUserState();

  @override
  List<Object> get props => [];
}

final class VerifyUserInitial extends VerifyUserState {}

final class VerifyUserLoadingState extends VerifyUserState {}

final class EmailSendSuccessState extends VerifyUserState {}

final class VerificationFailedState extends VerifyUserState {
  final String title;
  final String message;
  const VerificationFailedState({
    required this.title,
    required this.message,
  });
}

final class UserNotVerifiedState extends VerifyUserState {}

final class UserVerificationSuccessState extends VerifyUserState {
  const UserVerificationSuccessState();
}
