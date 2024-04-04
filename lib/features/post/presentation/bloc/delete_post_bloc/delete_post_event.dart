part of 'delete_post_bloc.dart';

sealed class DeletePostEvent extends Equatable {
  const DeletePostEvent();

  @override
  List<Object> get props => [];
}

final class DeleteBuyTymPostEvent extends DeletePostEvent{
  final String postId;
  final String userId;
  const DeleteBuyTymPostEvent({required this.postId, required this.userId});
}

final class DeleteSellTymPostEvent extends DeletePostEvent{
  final String postId;
  final String userId;
  const DeleteSellTymPostEvent({required this.postId, required this.userId});
}