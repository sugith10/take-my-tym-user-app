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
  final AppAlert  error;
  const VerificationFailedState({
    required this.error,
  });
}

final class UserNotVerifiedState extends VerifyUserState {
    final AppAlert  error;
     const UserNotVerifiedState({
    required this.error,
  });
}

final class UserVerificationSuccessState extends VerifyUserState {
  const UserVerificationSuccessState();
}
