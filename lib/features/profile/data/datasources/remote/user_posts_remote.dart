import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';

final class UserPostsRemote {
  Future<List<PostModel>> userBuyTymPosts(String uid) async {
    try {
      final posts = await FirebaseFirestore.instance
          .collection('buyTymPost')
          .where("uid", isEqualTo: uid)
          .orderBy('postDate', descending: true)
          .get();
      if (posts.docs.isEmpty) {
        throw const AppException(alert: "No data found");
      }
      final buyTymPosts = posts.docs
          .map(
            (doc) => PostModel.fromMap(
              doc.data(),
              postId: doc.id,
            ),
          )
          .toList();

      return buyTymPosts;
    } catch (e) {
      throw AppException(alert: e.toString(), details: e.toString());
    }
  }

  Future<List<PostModel>> userSellTymPosts(String uid) async {
    try {
      final posts = await FirebaseFirestore.instance
          .collection('sellTymPost')
          .where("uid", isEqualTo: uid)
          .orderBy('postDate', descending: false)
          .get();
      if (posts.docs.isEmpty) {
        throw const AppException(alert: "No data found");
      }
      final buyTymPosts = posts.docs
          .map(
            (doc) => PostModel.fromMap(
              doc.data(),
              postId: doc.id,
            ),
          )
          .toList();

      return buyTymPosts;
    } catch (e) {
      throw AppException(alert: e.toString(), details: e.toString());
    }
  }
}
