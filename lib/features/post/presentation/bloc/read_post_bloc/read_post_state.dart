part of 'read_post_bloc.dart';

sealed class ReadPostsState extends Equatable {
  const ReadPostsState();
  
  @override
  List<Object> get props => [];
}

final class UserPostInitial extends ReadPostsState {}

final class UserPostsLoadingState extends ReadPostsState{}

final class GotBuyTymPostsState extends ReadPostsState{
  final List<PostModel> buyTymPostModel;
  const GotBuyTymPostsState({required this.buyTymPostModel});

  @override
  List<Object> get props => [buyTymPostModel];
}

final class GotSellTymPostsState extends ReadPostsState{
  final List<PostModel> sellTymPostModels;
  const GotSellTymPostsState({required this.sellTymPostModels});

  @override
  List<Object> get props => [sellTymPostModels];
}