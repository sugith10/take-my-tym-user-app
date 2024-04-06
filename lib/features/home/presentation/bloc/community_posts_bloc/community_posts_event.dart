part of 'community_posts_bloc.dart';

sealed class CommunityPostsEvent extends Equatable {
  const CommunityPostsEvent();

  @override
  List<Object> get props => [];
}

final class BuyTymCommunityPostsEvent extends CommunityPostsEvent{}

final class SellTymCommunityPostsEvent extends CommunityPostsEvent{}


