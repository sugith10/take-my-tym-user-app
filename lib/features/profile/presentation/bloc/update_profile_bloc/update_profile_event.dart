part of 'update_profile_bloc.dart';

sealed class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileSetupEvent extends UpdateProfileEvent {
  final String userName;
  final String about;
  final LocationBloc locationBloc;

  final String profession;
  final UserModel userModel;

  const ProfileSetupEvent({
    required this.userName,
    required this.about,
    required this.locationBloc,
    required this.profession,
    required this.userModel,
  });
}

final class ProfileSetupFailEvent extends UpdateProfileEvent {}

final class ProfileUpdateEvent extends UpdateProfileEvent {
  final String userName;
  final String firstName;
  final String lastName;
  final String about;
  final String location;
  final XFile? image;
  final UserModel userModel;

  const ProfileUpdateEvent({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.about,
    required this.location,
    required this.image,
    required this.userModel,
  });
}
