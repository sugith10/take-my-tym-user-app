part of 'social_auth_bloc.dart';

sealed class SocialAuthState extends Equatable {
  const SocialAuthState();

  @override
  List<Object> get props => [];
}

final class SocialAuthInitial extends SocialAuthState {}

final class SocialAuthLoadingState extends SocialAuthState {}

final class SocialAuthSuccessState extends SocialAuthState {
  final UserModel userModel;
  final bool profileSetupComp;
  const SocialAuthSuccessState({required this.profileSetupComp, required this.userModel});
    @override
  List<Object> get props => [userModel,profileSetupComp];
}

final class SocialAuthFailState extends SocialAuthState {
   final AppAlert  error;

  const SocialAuthFailState({
    required this.error,
  });
}
