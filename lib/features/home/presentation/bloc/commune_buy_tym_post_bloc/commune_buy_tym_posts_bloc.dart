// import 'dart:developer';

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:take_my_tym/core/model/app_post_model.dart';
// import 'package:take_my_tym/features/home/domain/usecases/new_posts_use_case.dart';

// part 'commune_buy_tym_posts_event.dart';
// part 'commune_buy_tym_posts_state.dart';

// class CommuneBuyTymPostsBloc
//     extends Bloc<NewPostsEvent, CommuneBuyTymPostsState> {
//   final NewBuyTymPostsUseCase _newPostsUseCase;
//   CommuneBuyTymPostsBloc({
//     required NewBuyTymPostsUseCase newPostsUseCase,
//   })  : _newPostsUseCase = newPostsUseCase,
//         super(NewPostsLoading()) {
//     on<NewPostsEvent>(
//       (event, emit) async {
//         try {
//           final List<PostModel> posts = await _newPostsUseCase.call();
//           emit(NewPostsResult(posts: posts));
//         } catch (e) {
//           log(e.toString());
//         }
//       },
//     );
    
//   }
// }
