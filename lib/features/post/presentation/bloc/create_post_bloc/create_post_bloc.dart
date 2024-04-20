import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/post/domain/usecases/create_post_usecase.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial()) {
    // First page data
    String? uid;
    String? userName;
    bool? tymType;
    String? workType;
    String? title;
    String? content;
    // Second page data
    List<String>? skills;
    String? location;
    String? experience;
    double? remuneration;

    on<CreateFirstPageEvent>(
      (event, emit) {
        if (event.title.length <= 3) {
          emit(
            CreateFirstFailState(
              message: 'Give proper title',
              description:
                  'Gave a proper title, Other wise its harder for other to understand it',
            ),
          );
          return;
        } else if (event.content.length <= 10) {
          emit(
            CreateFirstFailState(
              message: 'Give proper decription',
              description:
                  'Gave a proper decription, Other wise its harder for other to understand it',
            ),
          );
          return;
        } else {
          uid = event.userModel.uid;
          userName = "${event.userModel.firstName} ${event.userModel.lastName}";
          tymType = event.tymType;
          workType = event.workType;
          title = event.title;
          content = event.content;
          emit(CreateFirstSuccessState());
        }
      },
    );

    on<CreateSecondPageEvent>(
      ((event, emit) async {
        emit(CreatPostLoadingState());
        if (event.location.length <= 2) {
          log(event.location);
          emit(
            CreateSecondFailState(
              message: event.location,
              description:
                  "Its very important to gave your location when you make a post",
            ),
          );
          return;
        } else if (event.experience.length <= 2) {
          log("2");
          emit(CreateSecondFailState(
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
              CreateSecondFailState(
                message: "No text allowed in Remuneration",
                description: "Only numbers can added in the Remuneration",
              ),
            );
            return;
          }
          if (remuneration! >= 1000000) {
            log("4");
            emit(CreateSecondFailState(
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
            tymType != null &&
            workType != null &&
            title != null &&
            content != null &&
            skills != null &&
            location != null &&
            experience != null &&
            remuneration != null) {
          CreatePostUseCase createPostUseCase =
              GetIt.instance<CreatePostUseCase>();

          if (tymType != null && tymType == true) {
            try {
              final bool res = await createPostUseCase.buyTymPost(
                postModel: PostModel(
                  tymType: true,
                  uid: uid!,
                  workType: workType!,
                  title: title!,
                  content: content!,
                  userName: userName!,
                  postDate: Timestamp.now(),
                  skills: skills!,
                  location: location!,
                  skillLevel: experience!,
                  price: remuneration!,
                  latitude: event.latitude,
                  longitude: event.longitude,
                ),
              );
              if (res) {
                   log("success buy");
                emit(CreatePostSuccessState(refreshType: true, uid: uid!));
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
          } else if (tymType != null && tymType == false) {
            try {
              final bool res = await createPostUseCase.sellTymPost(
                postModel: PostModel(
                  tymType: false,
                  uid: uid!,
                  workType: workType!,
                  title: title!,
                  content: content!,
                  userName: userName!,
                  postDate: Timestamp.now(),
                  location: location!,
                  skillLevel: experience!,
                  price: remuneration!,
                  skills: skills!,
                  latitude: event.latitude,
                  longitude: event.longitude,
                ),
              );
              if (res) {
             
                emit(CreatePostSuccessState(refreshType: false,uid: uid!));
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
