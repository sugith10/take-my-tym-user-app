import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_posts_event.dart';
part 'home_page_posts_state.dart';

class HomePagePostsBloc extends Bloc<HomePagePostsEvent, HomePagePostsState> {
  HomePagePostsBloc() : super(HomePagePostsLoadingState()) {
    on<HomePagePostsEvent>((event, emit) {
      
    });
  }
}
