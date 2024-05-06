import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/proposals/data/datasources/remote/proposal_remote.dart';
import 'package:take_my_tym/features/proposals/data/models/offer_model.dart';

part 'proposal_event.dart';
part 'proposal_state.dart';

class ProposalBloc extends Bloc<ProposalEvent, ProposalState> {
  ProposalBloc() : super(ProposalInitial()) {
    on<ProposalPageNavEvent>(_onPageNav);
    on<ProposalSubmitEvent>(_onSubmit);
  }

  void _onPageNav(ProposalPageNavEvent event, Emitter<ProposalState> emit) {
    emit(ProposalPageState(pageNumber: event.index));
  }

  void _onSubmit(
    ProposalSubmitEvent event,
    Emitter<ProposalState> emit,
  ) async {
    emit(ProposalLoadingState());
    try {
      final message = event.message.trim();
      if (message.length < 5) {
        final AppErrorMsg appError = AppErrorMsg(
          title: 'Please provide a proper messsage.',
          content: "Without proper message you can't a proposel...",
        );
        emit(ProposalErrorState(error: appError));
      } else {
        final offermodel = OfferModel(
          applicantUid: event.uid,
          message: event.message,
          postId: event.postModel.postId!,
          proposelDate: Timestamp.now(),
        );
        log(event.postModel.uid);
        await ProposalRemote().submit(
          offerModel: offermodel,
          hirerUid: event.postModel.uid,
        );
        emit(ProposalSuccessState());
      }
    } catch (e) {
      appLogger.d("proposel bloc  $e ");
      emit(
        ProposalErrorState(
          error: AppErrorMsg(
            title: "Already Submitted",
          ),
        ),
      );
    }
  }
}
