import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/proposal/data/datasources/remote/accept_proposal.dart';
import 'package:take_my_tym/features/proposal/data/datasources/remote/get_user_data.dart';
import 'package:take_my_tym/features/proposal/data/models/offer_model.dart';

import '../../../../contract/data/models/contract_model.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class AcceptProposalBloc extends Bloc<OfferEvent, OfferState> {
  AcceptProposalBloc() : super(OfferInitial()) {
    on<OfferDetailsEvent>(_onDetails);
    on<OfferRejectEvent>(_onReject);
    on<OfferAcceptEvent>(_onAccept);
  }

  void _onDetails(
    OfferDetailsEvent event,
    Emitter<OfferState> emit,
  ) async {
    emit(OfferLoading());
    try {
      final postModel = await GetPostData().get(
        postId: event.offerModel.postId,
        tymType: event.offerModel.tymType,
      );
      final userModel = await GetUserData().get(
        userId: event.offerModel.applicantUid,
      );
      appLogger.f(event.offerModel.offerId);
      emit(OfferLoaded(
        offerModel: event.offerModel,
        postModel: postModel,
        userModel: userModel,
      ));
    } catch (e) {
      appLogger.d(e.toString());
    }
  }

  void _onReject(
    OfferRejectEvent event,
    Emitter<OfferState> emit,
  ) {
    emit(OfferLoading());
    AcceptProposalRemote().rejectProposal(
      offerModel: event.offerModel,
      uid: event.userId,
    );
    emit(OfferSuccess());
  }

  void _onAccept(
    OfferAcceptEvent event,
    Emitter<OfferState> emit,
  ) async {
    try {
      final contractModel = ContractModel(
        date: Timestamp.now(),
        amount: event.postModel .price,
        clientId: event.userId,
        serviceProviderId: event.offerModel.applicantUid,
        contractStrated: true,
        paymentApproved: false,
        contractEnded: false,
        paymentId: event.paymentId,
        contractName: event.postModel.title,
      );
      await AcceptProposalRemote().acceptProposal(
        offerModel: event.offerModel,
        contractModel: contractModel,
      );
      emit(OfferSuccess());
    } catch (e) {
      emit(ProopsalFailedState());
    }
  }
}
