import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';

class CommunityPostsRemoteData {
  Future<List<PostModel>> sellTymPosts() async {
    try {
      final data =
          await FirebaseFirestore.instance.collection("sellTymPost").get();

      final List<PostModel> result = data.docs
          .map(
            (doc) => PostModel.fromMap(doc.data(), postId: doc.id),
          )
          .toList();
      log(result.toString());
      return result;
    } catch (e) {
      log(e.toString());
      throw MyAppException(
        title: toString(),
        message: toString(),
      );
    }
  }
}
