import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/proposals/data/datasources/remote/proposal_remote.dart';
import 'package:take_my_tym/features/proposals/data/models/offer_model.dart';
import 'package:take_my_tym/features/proposals/data/models/submit_model.dart';

part 'submit_proposal_event.dart';
part 'submit_proposal_state.dart';

class SubmitProposalBloc
    extends Bloc<SubmitProposalEvent, SubmitProposalState> {
  SubmitProposalBloc() : super(SubmitProposalPageState(pageNumber: 0)) {
    on<SubmitProposalPagEvent>(_onPageNav);
    on<ProposalSubmitEvent>(_onSubmit);
  }

  void _onPageNav(
      SubmitProposalPagEvent event, Emitter<SubmitProposalState> emit) {
    emit(SubmitProposalPageState(pageNumber: event.index));
  }

  void _onSubmit(
    ProposalSubmitEvent event,
    Emitter<SubmitProposalState> emit,
  ) async {
    emit(SubmitProposalLoadingState());
    try {
      final message = event.message.trim();
      if (message.length < 5) {
        final AppErrorMsg appError = AppErrorMsg(
          title: 'Please provide a proper messsage.',
          content: "Without proper message you can't a proposel...",
        );
        emit(SubmitProposalErrorState(error: appError));
      } else {
        final offermodel = OfferModel(
          applicantUid: event.uid,
          message: event.message,
          postId: event.postModel.postId!,
          tymType: event.postModel.tymType,
          proposelDate: Timestamp.now(),
        );
        final submitModel = SubmitModel(
          status: false,
          postId: event.postModel.postId!,
          postType: event.postModel.tymType,
          timestamp: Timestamp.now(),
        );

        await ProposalRemote().submit(
          offerModel: offermodel,
          submitModel: submitModel,
          hirerUid: event.postModel.uid,
        );

        emit(SubmitProposalSuccessState());
      }
    } catch (e) {
      appLogger.d("proposel bloc  $e ");
      emit(
        SubmitProposalErrorState(
          error: AppErrorMsg(
            title: "Already submitted",
          ),
        ),
      );
    }
  }
}
