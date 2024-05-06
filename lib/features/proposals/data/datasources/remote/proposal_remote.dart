import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/proposals/data/models/offer_model.dart';
import 'package:take_my_tym/features/proposals/data/models/submit_model.dart';

class ProposalRemote {
  final _ref = FirebaseFirestore.instance.collection("proposals");
  Future<void> submit({
    required OfferModel offerModel,
    required SubmitModel submitModel,
    required String hirerUid,
  }) async {
    try {
      final applicantSubmitRef =
          _ref.doc(offerModel.applicantUid).collection("submit");

      final snap = await applicantSubmitRef
          .where("postId", isEqualTo: offerModel.postId)
          .get();

      if (snap.docs.isEmpty) {
        log("empty");
        await _ref.doc(hirerUid).collection("offers").add(offerModel.toMap());

        await _ref
            .doc(offerModel.applicantUid)
            .collection("submit")
            .add(submitModel.toMap());
        return;
      } else {
        throw AppException(
          alert: "Already Submitted",
          details: "Document with postId ${offerModel.postId} already exists.",
        );
      }
    } catch (e) {
      appLogger.e("From ProposalRemote $e");
      throw AppException(alert: e.toString(), details: e.toString());
    }
  }

  Future<void> getProposels({required String uid}) async {
    try {
      final snap = await _ref.get();
      if (snap.docs.isNotEmpty) {
        log("Success: ${snap.docs.length} proposals fetched");
      } else {
        log("No proposals found");
      }
    } catch (e) {
      appLogger.e("Error fetching proposals: $e");
      throw AppException(
        alert: "Error fetching proposals",
        details: e.toString(),
      );
    }
  }
}
