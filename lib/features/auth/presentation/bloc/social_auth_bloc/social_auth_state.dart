part of 'social_auth_bloc.dart';

sealed class SocialAuthState {
  const SocialAuthState();


}

final class SocialAuthInitial extends SocialAuthState {}

final class SocialAuthLoading extends SocialAuthState {}

final class SocialAuthSuccess extends SocialAuthState {
  final AuthUserModel userModel;
  
  SocialAuthSuccess(this.userModel){
    log(userModel.toString());
  }

  
}

final class SocialAuthError extends SocialAuthState {
  final String errorMessage;
  final String errorDescription;

  const SocialAuthError({
    required this.errorMessage,
    required this.errorDescription,
  });
}
