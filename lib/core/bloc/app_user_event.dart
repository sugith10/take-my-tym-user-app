part of 'app_user_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class GetAppUserModelEvent extends AppEvent {}

final class UpdateAppUserModelEvent extends AppEvent {
  final AppUserModel appUserModel;
  const UpdateAppUserModelEvent({required this.appUserModel});
  @override
  List<Object> get props => [appUserModel];
}

final class UpdateUserSignOutEvent extends AppEvent {}

final class EnsureAppUserModelExistsEvent extends AppEvent {}

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
