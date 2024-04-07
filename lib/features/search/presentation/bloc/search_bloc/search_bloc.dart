import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/search/domain/usecases/search_posts_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchPostsBloc extends Bloc<SearchPostsEvent, SearchPostsState> {
  SearchPostsBloc() : super(SearchPostsInitial()) {
   
    final SearchPostUseCase searchPostUseCase =
        GetIt.instance<SearchPostUseCase>();

    on<SwitchTymPostEvent>(((event, emit) {

      emit(SwitchTymPostState(tymType: event.tymType));
    }));
    on<SearchBuyTymPost>((event, emit) async {
      try {
        if (event.searchQuery.isNotEmpty) {
          await searchPostUseCase
              .searchBuyTymPost(searchQuery: event.searchQuery)
              .then(
            (value) {
              if (value.isEmpty) {
                log("its from blox $value yeh");
                emit(SearchPostsEmptyState());
              } else {
                emit(SearchPostsResultState(results: value));
              }
            },
          );
        } else {
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

    on<ClearSearchEvent>(((event, emit) {
      emit(SearchPostsInitial());
    }));
  }
}
