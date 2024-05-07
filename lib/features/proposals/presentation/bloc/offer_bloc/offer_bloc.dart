import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/proposals/data/datasources/remote/accept_proposal.dart';
import 'package:take_my_tym/features/proposals/data/datasources/remote/get_user_data.dart';
import 'package:take_my_tym/features/proposals/data/models/offer_model.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc() : super(OfferInitial()) {
    on<OfferDetailsEvent>(_onDetails);
    on<OfferRejectEvent>(_onReject);
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
}
