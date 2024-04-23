part of 'community_posts_bloc.dart';

sealed class CommunityPostsState extends Equatable {
  const CommunityPostsState();

  @override
  List<Object> get props => [];
}

final class CommunityPostsLoadingState extends CommunityPostsState {}

final class CommunityPostsSuccessState extends CommunityPostsState {
  final List<PostModel> posts;
  final List<PostModel> remotePosts;
  final List<PostModel> onsitePosts;
  const CommunityPostsSuccessState({
    required this.posts,
    required this.onsitePosts,
    required this.remotePosts,
  });
}

final class CommunityPostsFailedState extends CommunityPostsState {}
