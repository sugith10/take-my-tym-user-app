import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/features/post/domain/usecases/create_post_usecase.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial()) {

    // First page data
    String? uid;
    String? userName;
    bool? postType;
    String? workType;
    String? title;
    String? content;
    // Second page data
    List<String>? skills;
    String? location;
    String? experience;
    double? remuneration;

    on<CollectFirstPageDataEvent>((event, emit) {
      if (event.title.length <= 3) {
        emit(
          FirstDataCollectFailState(
            message: 'Give proper title',
            description:
                'Gave a proper title, Other wise its harder for other to understand it',
          ),
        );
        return;
      } else if (event.content.length <= 10) {
        emit(
          FirstDataCollectFailState(
            message: 'Give proper decription',
            description:
                'Gave a proper decription, Other wise its harder for other to understand it',
          ),
        );
        return;
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

    on<CollectSecondPageDataEvent>(((event, emit) {
      if (event.location.length <= 2) {
        log(event.location);
        emit(SecondDataCollectFailState(
            message: "${event.location}",
            description:
                "Its very important to gave your location when you make a post"));
        return;
      } else if (event.experience.length <= 2) {
         log("2");
        emit(SecondDataCollectFailState(
            message: "Gave Proper Experience",
            description:
                "Its very important what kind of experience you're expecting when you make a post"));
        return;
      } else {
        try {
          remuneration = double.parse(event.remuneration);
        } catch (e) {
           log("3");
          emit(
            SecondDataCollectFailState(
                message: "No text allowed in Remuneration",
                description: "Only numbers can added in the Remuneration",),
          );
          return;
        }
        if (remuneration! >= 1000000) {
           log("4");
          emit(SecondDataCollectFailState(
              message: "Remuneration limited under 10,00,000.",
              description: "Kindly ensure you entered with the limit"));
          return;
        } else {
          skills = event.skills;
          location = event.location;
          experience = event.experience;
        }
      }

      //Post Data

      if (uid != null &&
          userName != null &&
          postType != null &&
          workType != null &&
          title != null &&
          content != null &&
          skills != null &&
          location != null &&
          experience != null &&
          remuneration != null) {
            CreatePostUseCase _createPostUseCase = CreatePostUseCase()
            if(postType!){
              
            }else{

            }
          }
    }));
  }
}
