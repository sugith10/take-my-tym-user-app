part of 'community_posts_bloc.dart';

sealed class CommunityPostsState extends Equatable {
  const CommunityPostsState();
  
  @override
  List<Object> get props => [];
}

final class CommunityPostsLoadingState extends CommunityPostsState {}

final class BuyTymCommunityPostsState extends CommunityPostsState {
 final List<PostModel> buyTymPosts;
 const BuyTymCommunityPostsState({required this.buyTymPosts});
}

final class SellTymCommunityPostState extends CommunityPostsState {}

final class CommunityPostsFailedState extends CommunityPostsState {}