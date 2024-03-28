part of 'social_auth_bloc.dart';

sealed class SocialAuthEvent  {
  const SocialAuthEvent();

 
}

final class GoogleSignInEvent extends SocialAuthEvent {}
