part of 'search_bloc.dart';

sealed class SearchPostsEvent extends Equatable {
  const SearchPostsEvent();

  @override
  List<Object> get props => [];
}

final class SearchBuyTymPost extends SearchPostsEvent {
  final String searchQuery;
  const SearchBuyTymPost({required this.searchQuery});
}

final class SearchSellTymPost extends SearchPostsEvent {
  final String searchQuery;
  const SearchSellTymPost({required this.searchQuery});
}

final class ClearSearchEvent extends SearchPostsEvent {}

final class SwitchTymPostEvent extends SearchPostsEvent {
  final bool tymType;
  const SwitchTymPostEvent({required this.tymType});
}
