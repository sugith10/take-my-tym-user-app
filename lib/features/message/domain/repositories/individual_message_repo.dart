import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IndividualMessageRepo {
  Future<void> sendMessage({
    required String currentUid,
    required String receiverUid,
    required String message,
    required String senderName,
    required String receiverName,
  });

  Stream<QuerySnapshot> getMessages({
    required String currentUid,
    required String receiverUid,
  });
}
