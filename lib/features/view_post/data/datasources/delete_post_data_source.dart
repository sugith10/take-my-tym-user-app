import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class DeletePostRemoteData {
  Future<void> deletebBuyTymPost(
      {required String postId, required String userId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('buyTymPost')
          .doc(postId)
          .delete()
          .whenComplete(() async {
        final userPostDoc =
            FirebaseFirestore.instance.collection("usersPost").doc(userId);

        final userPost = await userPostDoc.get();

        if (userPost.exists) {
          final data = userPost.data();
          if (data != null && data.containsKey('buyTymPost')) {
            final List<dynamic> buyTymPostIds =
                userPost.data()!['buyTymPost'] as List<dynamic>;
            buyTymPostIds.remove(postId);
            await userPostDoc.update({"buyTymPost": buyTymPostIds});
          }
        }
      }).whenComplete(() {
        log('complete');
        return;
      });
    } catch (e) {
      log(e.toString());
      throw AppException;
    }
  }

  Future<void> deleteSellTymPost(
      {required String postId, required String userId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('sellTymPost')
          .doc(postId)
          .delete()
          .whenComplete(() async {
        final userPostDoc =
            FirebaseFirestore.instance.collection("usersPost").doc(userId);

        final userPost = await userPostDoc.get();

        if (userPost.exists) {
          final data = userPost.data();
          if (data != null && data.containsKey('sellTymPost')) {
            final List<dynamic> buyTymPostIds =
                userPost.data()!['sellTymPost'] as List<dynamic>;
            buyTymPostIds.remove(postId);
            await userPostDoc.update({"sellTymPost": buyTymPostIds});
          }
        }
      }).whenComplete(() {
        log('sell Tym Post complete');
        return;
      });
    } catch (e) {
      log(e.toString());
      throw AppException;
    }
  }
}
