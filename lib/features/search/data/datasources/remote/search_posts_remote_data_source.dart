import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';

class SearchPostsRemoteData {
  Future<List<PostModel>> searchBuyTymPost({required String search,required bool tymType}) async {
    log('Searching buy-tym posts for: $search');
    String type = tymType ? "buyTymPost" : "sellTymPost";
    log("remote data: $type");
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(type)
          .orderBy('title')
          .startAt([search]).endAt(['$search\uf8ff']).get();
      final List<PostModel> posts = querySnapshot.docs
          .map((doc) => PostModel.fromMap(doc.data(), postId: doc.id))
          .toList();
      return posts;
    } catch (e) {
      log(e.toString());
      throw const AppException();
    }
  }
}
