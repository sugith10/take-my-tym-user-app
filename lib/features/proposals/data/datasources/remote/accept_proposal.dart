import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/proposals/data/models/offer_model.dart';

class AcceptProposalRemote {
  final ref = FirebaseFirestore.instance.collection("proposals");
  Future<void> acceptProposal({
    required OfferModel offerModel,
    required String uid,
  }) async {
    
  }

  Future<void> rejectProposal({
    required OfferModel offerModel,
    required String uid,
  }) async {
    try {
      await ref.doc(uid).collection("offers").doc(offerModel.offerId).delete();
      await ref
          .doc(offerModel.applicantUid)
          .collection("submit")
          .doc(offerModel.postId)
          .update({"status": true});
      appLogger.d("success");
      return;
    } catch (e) {
      appLogger.e(e.toString());
      throw AppException(alert: e.toString());
    }
  }
}
