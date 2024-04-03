part of 'user_post_bloc.dart';

sealed class UserPostsState extends Equatable {
  const UserPostsState();
  
  @override
  List<Object> get props => [];
}

final class UserPostInitial extends UserPostsState {}

final class UserPostsLoadingState extends UserPostsState{}

final class GotBuyTymPostsState extends UserPostsState{
  final List<PostModel> buyTymPostModel;
  const GotBuyTymPostsState({required this.buyTymPostModel});

  @override
  List<Object> get props => [buyTymPostModel];
}

final class GotSellTymPostsState extends UserPostsState{
  final List<PostModel> sellTymPostModels;
  const GotSellTymPostsState({required this.sellTymPostModels});

  @override
  List<Object> get props => [sellTymPostModels];
}