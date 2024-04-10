part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();
  
  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class UserModelUpdatedState extends AppState{
  // final AppUserModel appUserModel;
  // const UserModelUpdatedState({required this.appUserModel});
}

final class UserModelNotFoundState extends AppState{}

final class UserExitState extends AppState {}