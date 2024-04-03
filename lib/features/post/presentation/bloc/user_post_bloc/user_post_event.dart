part of 'user_post_bloc.dart';

sealed class UserPostEvent extends Equatable {
  const UserPostEvent();

  @override
  List<Object> get props => [];
}

final class GetBuyTymPostsEvent extends UserPostEvent {}

final class GetSellTymPostsEvent extends UserPostEvent {}