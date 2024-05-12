import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/create_post/domain/usecases/update_post_usecase.dart';

import '../../../../location/presentation/bloc/location_bloc.dart';

part 'update_post_event.dart';
part 'update_post_state.dart';

class UpdatePostBloc extends Bloc<UpdatePostEvent, UpdatePostState> {
  UpdatePostBloc() : super(UpdatePostInitial()) {
    // First page data
    String? postId;
    String? uid;
    String? userName;
    bool? tymType;
    String? workType;
    String? title;
    String? content;
    Timestamp? postDate;
    // Second page data
    List<String>? skills;
    String? location;
    String? experience;
    double? remuneration;

    on<UpdateFirstPageEvent>(
      (event, emit) {
        log("update first bloc");
        emit(UpdatePostLoadingState());
        title = event.title.trim();
        content = event.content.trim();
        if (title!.length <= 3) {
          final AppErrorMsg error = AppErrorMsg(
              title: 'Give proper title',
              content:
                  'Gave a proper title, Other wise its harder for other to understand it');
          emit(
            UpdateFirstFailState(error: error),
          );
          return;
        } else if (content!.length <= 10) {
          final AppErrorMsg error = AppErrorMsg(
              title: 'Give proper decription',
              content:
                  'Gave a proper decription, Other wise its harder for other to understand it');
          emit(
            UpdateFirstFailState(
              error: error,
            ),
          );
          return;
        } else {
          postId = event.postModel.postId!;
          uid = event.postModel.uid;
          userName = event.postModel.userName;
          postDate = event.postModel.postDate;
          tymType = event.postModel.tymType;
          workType = event.workType;
          log("update success");
          emit(UpdateFirstSuccessState());
        }
      },
    );

    on<UpdateSecondPageEvent>(
      ((event, emit) async {
        log("update second bloc");
        emit(UpdatePostLoadingState());
        if (event.location.length <= 2) {
          log(event.location);
          emit(
            UpdateSecondFailState(
              message: event.location,
              description:
                  "Its very important to gave your location when you make a post",
            ),
          );
          return;
        } else if (event.experience.length <= 2) {
          log("2");
          emit(UpdateSecondFailState(
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
              UpdateSecondFailState(
                message: "No text allowed in Remuneration",
                description: "Only numbers can added in the Remuneration",
              ),
            );
            return;
          }
          if (remuneration! >= 1000000) {
            log("4");
            emit(UpdateSecondFailState(
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
        if (postId != null &&
            uid != null &&
            userName != null &&
            tymType != null &&
            workType != null &&
            title != null &&
            content != null &&
            skills != null &&
            location != null &&
            experience != null &&
            remuneration != null) {
          UpdatePostUseCase updatePostUseCase =
              GetIt.instance<UpdatePostUseCase>();
          if (tymType != null && tymType == true) {
            try {
              await updatePostUseCase
                  .updateBuyTymPost(
                      postModel: PostModel(
                postId: postId,
                tymType: tymType!,
                uid: uid!,
                workType: workType!,
                title: title!,
                content: content!,
                userName: userName!,
                postDate: postDate!,
                location: location!,
                skillLevel: experience!,
                price: remuneration!,
                skills: skills!,
                latitude: event.latitude,
                longitude: event.longitude,
              ))
                  .then((value) {
                emit(UpdatePostSuccessState(refreshType: tymType!, uid: uid!));
              });
            } on AppException catch (e) {
              emit(
                UpdatePostFailState(
                  error: AppErrorMsg(),
                ),
              );
            } catch (e) {
              emit(
                UpdatePostFailState(
                  error: AppErrorMsg(),
                ),
              );
            }
          } else if (tymType != null && tymType == false) {
            try {
              await updatePostUseCase
                  .updateSellTymPost(
                postModel: PostModel(
                  postId: postId,
                  tymType: tymType!,
                  uid: uid!,
                  workType: workType!,
                  title: title!,
                  content: content!,
                  userName: userName!,
                  postDate: postDate!,
                  location: location!,
                  skillLevel: experience!,
                  price: remuneration!,
                  skills: skills!,
                  latitude: event.latitude,
                  longitude: event.longitude,
                ),
              )
                  .then((value) {
                emit(UpdatePostSuccessState(refreshType: tymType!, uid: uid!));
              });
            } on AppException catch (e) {
              emit(UpdatePostFailState(error: AppErrorMsg()));
            } catch (e) {
              emit(
                UpdatePostFailState(
                  error: AppErrorMsg(),
                ),
              );
            }
          } else {
            log("something went wrong come to bloc line 177");
          }
        }
      }),
    );
  }
}
