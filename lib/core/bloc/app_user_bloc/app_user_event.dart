part of 'app_user_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class GetUserModelEvent extends AppEvent {}

final class UpdateUserModelEvent extends AppEvent {
  final UserModel userModel;
  const UpdateUserModelEvent({required this.userModel});
  @override
  List<Object> get props => [UserModel];
}

final class UpdateUserSignOutEvent extends AppEvent {}

final class EnsureUserModelExistsEvent extends AppEvent {}

final class UpdateUserLocationEvent extends AppEvent {
  final String location;
  final double latitude;
  final double longitude;
  const UpdateUserLocationEvent({
    required this.location,
    required this.latitude,
    required this.longitude,
  });
}
