part of 'user_post_bloc.dart';

sealed class UserPostState extends Equatable {
  const UserPostState();
  
  @override
  List<Object> get props => [];
}

final class UserPostInitial extends UserPostState {}
