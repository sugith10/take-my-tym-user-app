part of 'read_post_bloc.dart';

sealed class ReadPostEvent  {
  const ReadPostEvent();


}

final class GetBuyTymPostsEvent extends ReadPostEvent {
  String userId;
   GetBuyTymPostsEvent({required this.userId});
}

final class GetSellTymPostsEvent extends ReadPostEvent {
   String userId;
   GetSellTymPostsEvent({required this.userId});
}