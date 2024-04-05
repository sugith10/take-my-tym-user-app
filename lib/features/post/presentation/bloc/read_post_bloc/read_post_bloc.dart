import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/domain/usecases/get_user_posts_usecase.dart';

part 'read_post_event.dart';
part 'read_post_state.dart';

class ReadPostsBloc extends Bloc<ReadPostEvent, ReadPostsState> {
  ReadPostsBloc() : super(UserPostsLoadingState()) {
    final GetUserPostsUseCase getUserPostsUseCase =
        GetIt.instance<GetUserPostsUseCase>();

    on<GetBuyTymPostsEvent>((event, emit) async {
      emit(UserPostsLoadingState());
      try {
        List<PostModel> userBuyTymPost =
            await getUserPostsUseCase.getBuyTymPosts(userId: event.userId);
        log("bloc got it yeh: $userBuyTymPost");
        emit(GotBuyTymPostsState(buyTymPostModel: userBuyTymPost));
      } catch (e) {}
    });

    on<GetSellTymPostsEvent>(((event, emit) async {
      emit(UserPostsLoadingState());
      log("its sell tym posts");

      try {
        List<PostModel> postModels =
            await getUserPostsUseCase.getSellTymPosts(userId: event.userId);

        log('bloc got sell tym post -> $postModels');
        emit(GotSellTymPostsState(sellTymPostModels: postModels));
      } catch (e) {}
    }));
  }
}
