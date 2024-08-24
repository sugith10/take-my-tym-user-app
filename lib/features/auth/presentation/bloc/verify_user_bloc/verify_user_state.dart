part of 'verify_user_bloc.dart';

sealed class VerifyUserState extends Equatable {
  const VerifyUserState();

  @override
  List<Object> get props => [];
}

final class VerifyUserInitial extends VerifyUserState {}

final class VerifyUserLoadingState extends VerifyUserState {}

final class VerifyUserEmailSendState extends VerifyUserState {}

final class VerifyUserFailedState extends VerifyUserState {
  final AppAlert  error;
  const VerifyUserFailedState({
    required this.error,
  });
}

final class VerifyUserNotFoundState extends VerifyUserState {
    final AppAlert  error;
     const VerifyUserNotFoundState({
    required this.error,
  });
}

final class VerifyUserSuccessState extends VerifyUserState {
  const VerifyUserSuccessState();
}
