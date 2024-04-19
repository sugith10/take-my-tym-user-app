part of 'home_page_posts_bloc.dart';

sealed class HomePagePostsState extends Equatable {
  const HomePagePostsState();
  
  @override
  List<Object> get props => [];
}

final class HomePagePostsLoadingState extends HomePagePostsState {}

final class HomePagePostsLoadedState extends HomePagePostsState {}