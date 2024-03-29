part of 'social_auth_bloc.dart';

sealed class SocialAuthState extends Equatable {
  const SocialAuthState();

  @override
  List<Object> get props => [];
}

final class SocialAuthInitial extends SocialAuthState {}

final class SocialAuthLoadingState extends SocialAuthState {}

final class SocialAuthSuccessState extends SocialAuthState {
  final AuthUserModel userModel;

  const SocialAuthSuccessState(this.userModel);
}

final class SocialAuthFailState extends SocialAuthState {
  final String errorMessage;
  final String errorDescription;

  const SocialAuthFailState({
    required this.errorMessage,
    required this.errorDescription,
  });
}
