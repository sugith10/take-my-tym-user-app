part of 'update_profile_bloc.dart';

sealed class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileSetupEvent extends UpdateProfileEvent {
  final String userName;
  final String about;
  final String location;
  final double latitude;
  final double longitude;
  final String profession;
  final AppUserModel appUserModel;

  const ProfileSetupEvent({
    required this.userName,
    required this.about,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.profession,
    required this.appUserModel,
  });
}

final class CollectUpdateDataEvent extends UpdateProfileEvent {
  final String userName;
  final String about;
  final String location;
  final File? image;
  final AppUserModel userModel;

  const CollectUpdateDataEvent({
    required this.userName,
    required this.about,
    required this.location,
    required this.image,
    required this.userModel,
  });
}
