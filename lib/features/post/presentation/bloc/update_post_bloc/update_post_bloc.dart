import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/domain/usecases/update_post_usecase.dart';

part 'update_post_event.dart';
part 'update_post_state.dart';

class UpdatePostBloc extends Bloc<UpdatePostEvent, UpdatePostState> {
  UpdatePostBloc() : super(UpdatePostInitial()) {
    UpdatePostUseCase updatePostUseCase = GetIt.instance<UpdatePostUseCase>();
    on<UpdateBuyTymPostEvent>(
      (event, emit) async {
        log("on update bloc -> buyTym ${event.postModel}");
        emit(UpdatePostLoadingState());
        try {
          PostModel updatedPostModel = await updatePostUseCase.updateBuyTymPost(
              postModel: event.postModel);
          emit(UpdatePostSuccessState(postModel: updatedPostModel));
        } catch (e) {
          emit(UpdatePostFailState(
              message: e.toString(), description: e.toString()));
          log(e.toString());
        }
      },
      
    );

    on<UpdateSellTymPostEvent>(
      (event, emit) async {
        log("on update bloc -> buyTym");
        emit(UpdatePostLoadingState());
        try {
          PostModel updatedPostModel = await updatePostUseCase.updateSellTymPost(
              postModel: event.postModel);
          emit(UpdatePostSuccessState(postModel: updatedPostModel));
        } catch (e) {
          emit(UpdatePostFailState(
              message: e.toString(), description: e.toString()));
          log(e.toString());
        }
      },
    );
  }
}
