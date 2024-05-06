import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/proposals/data/models/offer_model.dart';

class ProposalRemote {
    final ref = FirebaseFirestore.instance.collection("proposals");
  Future<void> submit({
    required OfferModel offerModel,
    required String hirerUid,
  }) async {
    try {
  
      final applicantSubmitRef =
          ref.doc(offerModel.applicantUid).collection("submit");
      final querySnapshot = await applicantSubmitRef
          .doc(offerModel.postId).get();
      if (!querySnapshot.exists) {
        log("empty");
        await ref.doc(hirerUid).collection("offers").add(offerModel.toMap());
        await ref
            .doc(offerModel.applicantUid)
            .collection("submit")
            .doc(offerModel.postId)
          .update({"status": false});
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

  // Future<List<dynamic>> proposels({required String uid}) async {
  //   try {
  //     final data = await ref.doc(uid).get();

  //     if(data.exists){
  //      final Map<String, dynamic> collection = data.data()!;
  //      if(collection.containsKey("submit")){
  //       final Map<String
  //      }
  //     }
  //   } catch (e) {

  //   }
  // }
}
