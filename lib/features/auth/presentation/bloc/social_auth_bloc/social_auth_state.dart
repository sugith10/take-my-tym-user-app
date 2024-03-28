part of 'social_auth_bloc.dart';

sealed class SocialAuthState extends Equatable {
  const SocialAuthState();

  @override
  List<Object> get props => [];
}

final class SocialAuthInitial extends SocialAuthState {}

final class SocialAuthLoading extends SocialAuthState {}

final class SocialAuthSuccess extends SocialAuthState {
  final AuthUserModel userModel;

  const SocialAuthSuccess(this.userModel);
}

final class SocialAuthError extends SocialAuthState {
  final String errorMessage;
  final String errorDescription;

  const SocialAuthError({
    required this.errorMessage,
    required this.errorDescription,
  });
}
