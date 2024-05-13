part of 'get_profile_bloc.dart';

sealed class GetProfileState extends Equatable {
  const GetProfileState();
  
  @override
  List<Object> get props => [];
}

final class GetProfileInitial extends GetProfileState {}
