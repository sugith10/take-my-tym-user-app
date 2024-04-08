part of 'update_profile_bloc.dart';

sealed class UpdateProfileState extends Equatable {
  const UpdateProfileState();
  
  @override
  List<Object> get props => [];
}

final class UpdateProfileInitial extends UpdateProfileState {}
