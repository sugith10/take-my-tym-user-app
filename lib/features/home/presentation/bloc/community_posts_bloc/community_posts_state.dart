part of 'community_posts_bloc.dart';

sealed class CommunityPostsState extends Equatable {
  const CommunityPostsState();
  
  @override
  List<Object> get props => [];
}

final class CommunityPostsLoadingState extends CommunityPostsState {}

final class CommunityPostsSuccessState extends CommunityPostsState {
 final List<PostModel>posts;
 const CommunityPostsSuccessState({required this.posts});
}



final class CommunityPostsFailedState extends CommunityPostsState {}
