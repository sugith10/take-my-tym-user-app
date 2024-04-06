import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/create_post/domain/usecases/delete_post_usecase.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  DeletePostBloc() : super(DeletePostInitial()) {
    DeletePostUseCase deletePostUseCase = GetIt.instance<DeletePostUseCase>();
    on<DeleteBuyTymPostEvent>(
      (event, emit) async {
        emit(DeletePostLoading());
        try {
          log('on delete bloc');
          await deletePostUseCase
              .deleteBuyTymPost(postId: event.postId, userId: event.userId)
              .whenComplete(() => emit(DeletPostSuccessState()));
        } catch (e) {
          e.toString();
          emit(
            DeletPostFailState(
              message: e.toString(),
              description: e.toString(),
            ),
          );
        }
      },
    );

    on<DeleteSellTymPostEvent>(
      ((event, emit)async {
        try {
          emit(DeletePostLoading());
         await deletePostUseCase.deleteSellTymPost(
              postId: event.postId, userId: event.userId).whenComplete(() => emit(DeletPostSuccessState()));
        } catch (e) {
          emit(
            DeletPostFailState(
              message: e.toString(),
              description: e.toString(),
            ),
          );
        }
      }),
    );
  }
}
