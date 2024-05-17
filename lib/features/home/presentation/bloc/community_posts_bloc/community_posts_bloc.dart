import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/home/domain/usecases/get_community_posts_usecase.dart';

part 'community_posts_event.dart';
part 'community_posts_state.dart';

class CommunityPostsBloc
    extends Bloc<CommunityPostsEvent, CommunityPostsState> {
  bool tymType = true;
  CommunityPostsBloc() : super(CommunityPostsLoadingState()) {
    CommunityPostsUseCase communityPostsUseCase =
        GetIt.instance<CommunityPostsUseCase>();
    on<BuyTymCommunityPostsEvent>((event, emit) async {
      tymType = true;
      emit(CommunityPostsLoadingState());
      try {
        final List<PostModel> posts =
            await communityPostsUseCase.remoteBuyTymPosts(userId: event.userId);

        final List<PostModel> onsitePosts =
            await communityPostsUseCase.onsiteBuyTymPosts(userId: event.userId);

        await communityPostsUseCase.latestbuyTymPosts(userId: event.userId).then((value) => emit(
            CommunityPostsSuccessState(
                onsitePosts: onsitePosts, posts: value, remotePosts: posts)));
      } catch (e) {
        log(e.toString());
      }
    });
    on<SellTymCommunityPostsEvent>((event, emit) async {
      tymType = false;
      emit(CommunityPostsLoadingState());
      try {
        final List<PostModel> posts =
            await communityPostsUseCase.remoteBuyTymPosts(userId: event.userId);
        final List<PostModel> onsitePosts =
            await communityPostsUseCase.onsiteBuyTymPosts(userId: event.userId);

//TODO:fix error
        await communityPostsUseCase.sellTymPosts(userId: event.userId).then(
              (value) => emit(
                CommunityPostsSuccessState(
                  onsitePosts: onsitePosts,
                  posts: value,
                  remotePosts: posts,
                ),
              ),
            );
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
