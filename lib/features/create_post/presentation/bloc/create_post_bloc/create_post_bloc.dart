import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/create_post/domain/repositories/create_post_repo.dart';
import 'package:take_my_tym/features/create_post/domain/usecases/create_post_usecase.dart';

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
        uid = event.userModel.uid;
        userName = "${event.userModel.firstName} ${event.userModel.lastName}";
        postType = event.postType;
        workType = event.workType;
        title = event.title;
        content = event.content;
        emit(FirstDataCollectSuccessState());
      }
    });

    on<CollectSecondPageDataEvent>(
      ((event, emit) async {
        emit(CreatPostLoadingState());
        if (event.location.length <= 2) {
          log(event.location);
          emit(
            SecondDataCollectFailState(
              message: event.location,
              description:
                  "Its very important to gave your location when you make a post",
            ),
          );
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
                description: "Only numbers can added in the Remuneration",
              ),
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
            log("data adding success");
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
          CreatePostUseCase createPostUseCase =
              CreatePostUseCase(GetIt.instance<CreatePostRepo>());
          if (postType != null && postType == true) {
            try {
              final bool res = await createPostUseCase.buyTymPost(
                postModel: PostModel(
                  tymType: true,
                  uid: uid!,
                  workType: workType!,
                  title: title!,
                  content: content!,
                  userName: userName!,
                  postDate: DateTime.now(),
                  skills: skills!,
                  location: location!,
                  skillLevel: experience!,
                  price: remuneration!,
                ),
              );
              if (res) {
                emit(RemoteDataAddSuccessState());
              } else {
                emit(RemoteDataAddFailState(
                    message: "Failed to add data",
                    description:
                        "Lorem Ipsum is simply dummy typesetting industry"));
              }
            } on MyAppException catch (e) {
              emit(RemoteDataAddFailState(
                  message: e.toString(), description: e.toString()));
            } catch (e) {
              emit(RemoteDataAddFailState(
                  message: e.toString(), description: e.toString()));
            }
          } else if (postType != null && postType == false) {
            try {
              final bool res = await createPostUseCase.sellTymPost(
                postModel: PostModel(
                  tymType: false,
                  uid: uid!,
                  workType: workType!,
                  title: title!,
                  content: content!,
                  userName: userName!,
                  postDate: DateTime.now(),
                  location: location!,
                  skillLevel: experience!,
                  price: remuneration!,
                  skills: skills!,
                ),
              );

              if (res) {
                emit(RemoteDataAddSuccessState());
              } else {
                emit(RemoteDataAddFailState(
                    message: "Failed to add data",
                    description:
                        "Lorem Ipsum is simply dummy typesetting industry"));
              }
            } on MyAppException catch (e) {
              emit(RemoteDataAddFailState(
                  message: e.toString(), description: e.toString()));
            } catch (e) {
              emit(RemoteDataAddFailState(
                  message: e.toString(), description: e.toString()));
            }
          } else {
            log("something went wrong come to bloc line 163");
          }
        }
      }),
    );
  }
}
