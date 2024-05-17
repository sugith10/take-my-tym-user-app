// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:take_my_tym/core/model/app_post_model.dart';
// import 'package:take_my_tym/features/home/data/datasources/remote/buy_tym_community_posts.dart';

// part 'home_page_posts_event.dart';
// part 'home_page_posts_state.dart';

// class HomePagePostsBloc extends Bloc<HomePagePostsEvent, HomePagePostsState> {
//   HomePagePostsBloc() : super(HomePagePostsLoadingState()) {
//     on<HomePagePostsEvent>((event, emit) async {
//       emit(HomePagePostsLoadingState());
//       final stream =
//           BuyTymCommunityPostsRepo().newPosts().asyncMap((snapshot) async {
//         try {
//           return snapshot.docs
//               .map((doc) => PostModel.fromSnapshot(doc))
//               .toList();
//         } catch (e) {
//           rethrow;
//         }
//       });
//       emit(HomePagePostsLoadedState(posts: stream));
//     });
//   }
// }
