import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/util/app_error_msg.dart';
import 'package:take_my_tym/features/view_post/domain/usecases/delete_post_usecase.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  DeletePostBloc() : super(DeletePostInitial()) {
    DeletePostUseCase deletePostUseCase = GetIt.instance<DeletePostUseCase>();

    on<DeletePersonalPostEvent>(
      ((event, emit) async {
        /// TymType == true ? BuyTymPost : SellTymPost
        emit(DeletePostLoading());
        if (event.postModel.tymType) {
          //BuyTymPost Delete
          try {
            log('on delete bloc');
            await deletePostUseCase
                .deleteBuyTymPost(
                  postId: event.postModel.postId!,
                  userId: event.postModel.uid,
                )
                .then(
                  (value) => emit(
                    DeletPostSuccessState(
                      refreshType: event.postModel.tymType,
                      uid: event.postModel.uid,
                    ),
                  ),
                );
          } catch (e) {
            e.toString();
            emit(
              DeletPostFailState(
                  appAlert: AppAlert(
                alert: "Post Deletion Failed",
                details:
                    "An error occurred while trying to delete the post. Please try again.",
              )),
            );
          }
        } else {
          //SellTymPost Delete
          try {
            log('on delete bloc');
            await deletePostUseCase
                .deleteSellTymPost(
                  postId: event.postModel.postId!,
                  userId: event.postModel.uid,
                )
                .then(
                  (value) => emit(
                    DeletPostSuccessState(
                      refreshType: event.postModel.tymType,
                      uid: event.postModel.uid,
                    ),
                  ),
                );
          } catch (e) {
            e.toString();
            emit(
              DeletPostFailState(
                  appAlert: AppAlert(
                alert: "Post Deletion Failed",
                details:
                    "An error occurred while trying to delete the post. Please try again.",
              )),
            );
          }
        }
      }),
    );
  }
}
