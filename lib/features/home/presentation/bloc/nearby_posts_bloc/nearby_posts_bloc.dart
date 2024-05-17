import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/domain/usecases/new_posts_use_case.dart';

part 'nearby_posts_event.dart';
part 'nearby_posts_state.dart';

class NearbyPostsBloc extends Bloc<NearbyPostsEvent, NearbyPostsState> {
  final NearbyPostsUseCase _nearbyPostsUseCase;
  NearbyPostsBloc({
    required NearbyPostsUseCase newPostsUseCase,
  })  : _nearbyPostsUseCase = newPostsUseCase,
        super(NearbyPostsLoading()) {
    on<NearbyPostsEvent>(
      (event, emit) async {
        log("nearbyposts bloc got: ${event.location}, ${event.longitude}  ${event.latitude}");
        try {
          final List<PostModel> posts = await _nearbyPostsUseCase.call(
            latitude: 0.025,
            longitude: event.longitude,
            range: event.latitude,
            userId: event.userId,
          );
          log('nearbyposts ${posts.toString()}');
          emit(NearbyPostsResult(posts: posts));
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }
}
