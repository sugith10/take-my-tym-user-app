part of 'update_post_bloc.dart';

sealed class UpdatePostEvent extends Equatable {
  const UpdatePostEvent();

  @override
  List<Object> get props => [];
}

final class UpdateBuyTymPostEvent extends UpdatePostEvent {
  final PostModel postModel;
  const UpdateBuyTymPostEvent({required this.postModel});
}

final class UpdateSellTymPostEvent extends UpdatePostEvent {
  final PostModel postModel;
  const UpdateSellTymPostEvent({required this.postModel});
}
