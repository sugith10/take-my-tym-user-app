

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';

final class CreatePostRemoteData {
  Future<bool> buyTymPost({required PostModel postModel}) async {
    try {
      final buyTymPost = FirebaseFirestore.instance.collection('buyTymPost');
      final buyTymPostRef = await buyTymPost.add(postModel.toMap());

      final usersPostRef =
          FirebaseFirestore.instance.collection('usersPost').doc(postModel.uid);

      final usersPostSnapshot = await usersPostRef.get();

      if (usersPostSnapshot.exists) {
        final data = usersPostSnapshot.data();
        if (data != null && data.containsKey("buyTymPost")) {
          final List<dynamic> userPostIds =
              usersPostSnapshot.data()!['buyTymPost'] as List<dynamic>;
          userPostIds.add(buyTymPostRef.id);
          await usersPostRef.update({"buyTymPost": userPostIds});
        } else {
          final List<String> userIds = [buyTymPostRef.id];
          await usersPostRef.update({"buyTymPost": userIds});
        }
      } else {
        final List<String> userIds = [buyTymPostRef.id];
        await usersPostRef.set({
          "buyTymPost": userIds,
        });
      }
      // log("Data added successfully in buyTymPost - message from create post remote data");
      return true;
    } catch (e) {
      // log('Error adding data to buyTymPost: $e');
      throw AppException(
        details: e.toString(),
        alert: 'Remote data adding failed',
      );
    }
  }

  Future<bool> sellTymPost({required PostModel postModel}) async {
    try {
      final sellTymPost = FirebaseFirestore.instance.collection('sellTymPost');
      final sellTymPostRef = await sellTymPost.add(postModel.toMap());

      final usersPostRef =
          FirebaseFirestore.instance.collection("usersPost").doc(postModel.uid);

      final usersPostSnapshot = await usersPostRef.get();

      if (usersPostSnapshot.exists) {
        final data = usersPostSnapshot.data();
        if (data != null && data.containsKey('sellTymPost')) {
          final List<dynamic> userPostIds =
              usersPostSnapshot.data()!['sellTymPost'] as List<dynamic>;

          userPostIds.add(sellTymPostRef.id);
          await usersPostRef.update({"sellTymPost": userPostIds});
        } else {
          await usersPostRef.update({
            "sellTymPost": [sellTymPostRef.id]
          });
        }
      } else {
        final List<String> userIds = [sellTymPostRef.id];
        await usersPostRef.set({"sellTymPost": userIds});
      }

      // log("Data added successfully in sellTymPost - message from create post remote data");
      return true;
    } on FirebaseException catch (e) {
      // log('Firebase Exception: $e');
      throw AppException(
        alert: e.message ?? 'Unknown error occurred',
        details: 'Firebase Exception',
      );
    } catch (e) {
      // log('Unknown Exception: $e');
      throw const AppException(
          alert: 'Unknown error occurred', details: 'Unknown Exception');
    }
  }
}
