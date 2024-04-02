part of 'app_bloc.dart';

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
