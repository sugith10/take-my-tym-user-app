import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';

final class UpdatePostRemoteData {
  Future<PostModel> upadateBuyTymPosts({required PostModel postModel}) async {
    try {
      log("on updatebuy");
      await FirebaseFirestore.instance
          .collection("buyTymPost")
          .doc(postModel.postId)
          .update(postModel.toMap())
          .whenComplete(() async {
        log("Update successful! on updateBuy");
      });
      return postModel;
    } catch (e) {
      log("buy tym${e.toString()}");
      throw MyAppException(title: e.toString(), message: e.toString());
    }
  }
   Future<PostModel> upadateSellTymPosts({required PostModel postModel}) async {
    try {
      log('on sellTym');
      await FirebaseFirestore.instance
          .collection("sellTymPost")
          .doc(postModel.postId)
          .update(postModel.toMap())
          .whenComplete(() async {
        log("Update successful! on updateSell");
      });
      return postModel;
    } catch (e) {
      log(e.toString());
      throw MyAppException(title: e.toString(), message: e.toString());
    }
  }
}
