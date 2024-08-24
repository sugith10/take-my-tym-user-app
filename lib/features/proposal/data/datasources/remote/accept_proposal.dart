import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/util/app_exception.dart';
import 'package:take_my_tym/core/util/app_logger.dart';
import 'package:take_my_tym/features/contract/data/models/contract_model.dart';
import 'package:take_my_tym/features/proposal/data/models/offer_model.dart';

class AcceptProposalRemote {
  final _ref = FirebaseFirestore.instance.collection("proposals");
  Future<void> acceptProposal({
    required OfferModel offerModel,
    required ContractModel contractModel,
  }) async {
    await _ref
        .doc(contractModel.clientId)
        .collection("offers")
        .doc(offerModel.offerId)
        .delete();
    await _ref
        .doc(offerModel.applicantUid)
        .collection("submit")
        .doc(offerModel.postId)
        .delete();
    await FirebaseFirestore.instance
        .collection("buyTymPost")
        .doc(offerModel.postId)
        .delete();

    await FirebaseFirestore.instance
        .collection("contracts")
        .add(contractModel.toMap());
    appLogger.d("data add success success");
  }

  Future<void> rejectProposal({
    required OfferModel offerModel,
    required String uid,
  }) async {
    try {
      await _ref.doc(uid).collection("offers").doc(offerModel.offerId).delete();
      await _ref
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
