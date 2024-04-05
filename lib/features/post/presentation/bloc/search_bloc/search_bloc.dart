import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/post/data/datasources/remote_data_source/search_posts_remote_data_source.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchPostsBloc extends Bloc<SearchPostsEvent, SearchPostsState> {
  SearchPostsBloc() : super(SearchPostsInitial()) {
    on<SearchBuyTymPost>((event, emit) async {
      log("on buy.... ${event.searchQuery} ");
      try {
        SearchPostsRemoteData searchPostsRemoteData = SearchPostsRemoteData();
        emit(SearchPostsLoadingState());

        if (event.searchQuery.isNotEmpty) {
          final searchStream =
              searchPostsRemoteData.searchBuyTymPost(search: event.searchQuery);
          await for (final results in searchStream) {
            emit(SearchPostsResultState(results: results));
          }
        }else{
          emit(SearchPostsInitial());
        }
      } catch (e) {
        emit(SearchPostsErrorState(
          message: e.toString(),
          description: "error",
        ));
      }
    });

    on<SearchSellTymPost>((event, emit) {
      log("on search sellTym");
    });
  }
}
