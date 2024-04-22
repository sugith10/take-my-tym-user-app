part of 'nearby_posts_bloc.dart';

sealed class NearbyPostsState extends Equatable {
  const NearbyPostsState();
  
  @override
  List<Object> get props => [];
}

final class NearbyPostsLoading extends NearbyPostsState {}

final class NearbyPostsResult extends NearbyPostsState {
  final List<PostModel> posts;
  const NearbyPostsResult({required this.posts});
    
  @override
  List<Object> get props => [posts];
}
