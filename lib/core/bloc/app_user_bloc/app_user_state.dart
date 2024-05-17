part of 'app_user_bloc.dart';

sealed class AppState extends Equatable {
  
  const AppState();
  
  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class UserModelUpdatedState extends AppState{
  // final UserModel userModel;
  // const UserModelUpdatedState({required this.userModel});
}

final class UserModelNotFoundState extends AppState{}

final class UserExitState extends AppState {}