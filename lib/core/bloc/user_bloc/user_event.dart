part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class GetUserModelEvent extends UserEvent {}

final class UserUpdateEvent extends UserEvent {
  final UserModel userModel;
  const UserUpdateEvent({required this.userModel});
  @override
  List<Object> get props => [UserModel];
}

final class UserExitEvent extends UserEvent {}

final class UserCheckEvent extends UserEvent {}

final class UserLocationUpdateEvent extends UserEvent {
  final String location;
  final double latitude;
  final double longitude;
  const UserLocationUpdateEvent({
    required this.location,
    required this.latitude,
    required this.longitude,
  });
}
