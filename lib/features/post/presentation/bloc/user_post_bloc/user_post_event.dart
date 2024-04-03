part of 'user_post_bloc.dart';

sealed class UserPostEvent  {
  const UserPostEvent();


}

final class GetBuyTymPostsEvent extends UserPostEvent {
  String userId;
   GetBuyTymPostsEvent({required this.userId});
}

final class GetSellTymPostsEvent extends UserPostEvent {
   String userId;
   GetSellTymPostsEvent({required this.userId});
}