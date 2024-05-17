part of 'community_posts_bloc.dart';

sealed class CommunityPostsEvent extends Equatable {
  const CommunityPostsEvent();

  @override
  List<Object> get props => [];
}

final class BuyTymCommunityPostsEvent extends CommunityPostsEvent{
  final String userId;
  const BuyTymCommunityPostsEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}

final class SellTymCommunityPostsEvent extends CommunityPostsEvent{
   final String userId;
  const SellTymCommunityPostsEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}


