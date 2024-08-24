part of 'social_auth_bloc.dart';

sealed class SocialAuthEvent extends Equatable {
  const SocialAuthEvent();

   @override
  List<Object> get props => [];
}

final class GoogleSignEvent extends SocialAuthEvent {}
