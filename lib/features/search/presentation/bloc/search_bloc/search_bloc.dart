import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/util/app_logger.dart';
import 'package:take_my_tym/features/search/domain/usecases/search_posts_usecase.dart';


part 'search_event.dart';
part 'search_state.dart';

class SearchPostsBloc extends Bloc<SearchPostsEvent, SearchPostsState> {
  bool tymType = true;
  SearchPostsBloc() : super(SearchPostsInitial()) {
    final SearchPostUseCase searchPostUseCase =
        GetIt.instance<SearchPostUseCase>();

    on<SwitchTymPostEvent>(((event, emit) {
      emit(SwitchTymPostState(tymType: event.tymType));
    }));
    on<SearchBuyTymPost>((event, emit) async {
      emit(SearchPostsLoadingState());
      try {
        if (event.searchQuery.isNotEmpty) {
          List<PostModel> postModelList =
              await searchPostUseCase.searchBuyTymPost(
                  searchQuery: event.searchQuery, tymType: tymType);

          if (postModelList.isEmpty) {
            appLogger.e("empty data");
            emit(SearchPostsEmptyState());
          } else {
            emit(SearchPostsResultState(results: postModelList));
          }
        } else {
          emit(SearchPostsInitial());
        }
      } catch (e) {
        emit(
          SearchPostsErrorState(
            message: e.toString(),
            description: "error",
          ),
        );
      }
    });

    on<SearchSellTymPost>((event, emit) {});

    on<ClearSearchEvent>(((event, emit) {
      emit(SearchPostsInitial());
    }));
  }
}
