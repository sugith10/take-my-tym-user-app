import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/domain/usecases/get_user_posts_usecase.dart';

part 'user_post_event.dart';
part 'user_post_state.dart';

class UserPostsBloc extends Bloc<UserPostEvent, UserPostsState> {
  UserPostsBloc() : super(UserPostInitial()) {
    final GetUserPostsUseCase getUserPostsUseCase =
        GetIt.instance<GetUserPostsUseCase>();
    on<GetBuyTymPostsEvent>((event, emit) async {
      emit(UserPostsLoadingState());
      List<PostModel> userBuyTymPost =
          await getUserPostsUseCase.getBuyTymPosts(userId: event.userId);

      log("bloc got it yeh: $userBuyTymPost");

      emit(GotBuyTymPostsState(buyTymPostModel: userBuyTymPost));
    });

    on<GetSellTymPostsEvent>(((event, emit) async {
      emit(UserPostsLoadingState());
      log("its sell tym posts");
      List<PostModel> postModels =
          await getUserPostsUseCase.getSellTymPosts(userId: event.userId);

      log('bloc got sell tym post -> $postModels');
      emit(GotSellTymPostsState(sellTymPostModels: postModels));
    }));
  }
}
