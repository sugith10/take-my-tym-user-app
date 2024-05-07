import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

class GetUserData {
  Future<UserModel> get({required userId}) async {
    final userSnap =
        await FirebaseFirestore.instance.collection("users").doc(userId).get();

    final UserModel userModel = UserModel.fromMap(userSnap.data()!);
    return userModel;
  }
}

class GetPostData {
  Future<PostModel> get({required postId, required bool tymType}) async {
    final String collection = tymType ? "buyTymPost" : "sellTymPost";
    try {
      final postSnap = await FirebaseFirestore.instance
          .collection(collection)
          .doc(postId)
          .get();

      final PostModel postModel =
          PostModel.fromMap(postSnap.data()!, postId: postId);
      return postModel;
    } catch (e) {
      log(e.toString());
      throw AppException(alert: e.toString());
    }
  }
}
