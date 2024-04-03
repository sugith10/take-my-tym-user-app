part of 'profile_posts_bloc.dart';

sealed class ProfilePostsState extends Equatable {
  const ProfilePostsState();
  
  @override
  List<Object> get props => [];
}

final class ProfilePostsInitial extends ProfilePostsState {}
