part of 'search_bloc.dart';

sealed class SearchPostsState extends Equatable {
  const SearchPostsState();

  @override
  List<Object> get props => [];
}

class SearchPostsInitial extends SearchPostsState {}

class SearchPostsLoadingState extends SearchPostsState{}

class SearchPostsResultState extends SearchPostsState {
  final List<PostModel> results;
  const SearchPostsResultState({required this.results});
}

class SearchPostsEmptyState extends SearchPostsState {}

class SearchPostsErrorState extends SearchPostsState {
  final String message;
  final String description;

 const SearchPostsErrorState({
    required this.message,
    required this.description,
  });
}