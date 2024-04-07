part of 'community_posts_bloc.dart';

sealed class CommunityPostsState extends Equatable {
  const CommunityPostsState();
  
  @override
  List<Object> get props => [];
}

final class CommunityPostsLoadingState extends CommunityPostsState {}

final class CommunityPostsSuccessState extends CommunityPostsState {
 final List<PostModel> buyTymPosts;
 const CommunityPostsSuccessState({required this.buyTymPosts});
}



final class CommunityPostsFailedState extends CommunityPostsState {}