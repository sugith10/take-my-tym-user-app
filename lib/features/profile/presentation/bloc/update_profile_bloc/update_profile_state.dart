part of 'update_profile_bloc.dart';

sealed class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileSuccessState extends UpdateProfileState {
  final UserModel userModel;
  const UpdateProfileSuccessState({required this.userModel});
}

final class UpdateProfileLoadingState extends UpdateProfileState {}

final class UpdataProfileFailState extends UpdateProfileState {
  final AppAlert alert;

  const UpdataProfileFailState({required this.alert});
}
