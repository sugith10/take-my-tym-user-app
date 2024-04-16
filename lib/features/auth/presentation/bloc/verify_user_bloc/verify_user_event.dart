part of 'verify_user_bloc.dart';

sealed class VerifyUserEvent extends Equatable {
  const VerifyUserEvent();

  @override
  List<Object> get props => [];
}

final class SendVerificationEmailEvent extends VerifyUserEvent{}

final class CheckVerificationEvent extends VerifyUserEvent{}

