import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial()) {
    String? uid;
    String? userName;
    bool? postType;
    String? workType;
    String? title;
    String? content;

    on<CollectFirstPageDataEvent>((event, emit) {
      if (event.title.length <= 3) {
        emit(
           FirstDataCollectFailState(
            message: 'Give proper title',
            description:
                'Gave a proper title, Other wise its harder for other to understand it',
          ),
        );
      } else if (event.content.length <= 10) {
        emit(
           FirstDataCollectFailState(
            message: 'Give proper decription',
            description:
                'Gave a proper decription, Other wise its harder for other to understand it',
          ),
        );
      } else {
        uid = event.uid;
        userName = event.userName;
        postType = event.postType;
        workType = event.workType;
        title = event.title;
        content = event.content;
        emit(FirstDataCollectSuccessState());
      }
    });
  }
}
