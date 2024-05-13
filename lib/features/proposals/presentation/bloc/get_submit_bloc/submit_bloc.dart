import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/proposals/data/datasources/remote/get_user_data.dart';
import 'package:take_my_tym/features/proposals/data/models/submit_model.dart';

part 'submit_event.dart';
part 'submit_state.dart';

class GetSubmitBloc extends Bloc<SubmitEvent, SubmitState> {
  GetSubmitBloc() : super(SubmitLoading()) {
    on<SubmitDetailsEvent>(_onDetails);
  }

  void _onDetails(SubmitDetailsEvent event, Emitter<SubmitState> emit) async {
    emit(SubmitLoading());
    try {
      final PostModel post = await GetPostData().get(
        postId: event.submitModel.postId,
        tymType: event.submitModel.postType,
      );
       appLogger.f(event.submitModel.submitId);
      emit(SubmitLoaded(
        postModel: post,
        submitModel: event.submitModel,
      ));
    } catch (e) {
      emit(SubmitFail());
    }
  }
}
