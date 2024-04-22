import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';

class CommunityPostsRemoteData {
  Future<List<PostModel>> latestbuyTymPosts() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("buyTymPost")
          .orderBy("postDate", descending: true)
          .get();
      final List<PostModel> result = data.docs
          .map(
            (doc) => PostModel.fromMap(doc.data(), postId: doc.id),
          )
          .toList();
      // log(result.toString());
      return result;
    } catch (e) {
      log(e.toString());
      throw MyAppException(
        title: toString(),
        message: toString(),
      );
    }
  }

  Future<List<PostModel>> nearbyBuyTymPosts({
    required double latitude,
    required double longitude,
    required double range,
  }) async {
    try {
      // const double range = 0.025;

      final CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('buyTymPost');
      final QuerySnapshot snapshot = await collectionRef.get();

      final List<PostModel> result = [];

      for (var doc in snapshot.docs) {
        final double postLatitude =
            (doc.data() as Map<String, dynamic>)['latitude'] as double;
        final double postLongitude =
            (doc.data() as Map<String, dynamic>)['longitude'] as double;

        if (postLatitude >= latitude - range &&
            postLatitude <= latitude + range &&
            postLongitude >= longitude - range &&
            postLongitude <= longitude + range) {
          final postModel = PostModel.fromMap(
            doc.data() as Map<String, dynamic>,
            postId: doc.id,
          );
          result.add(postModel);
        }
      }

      return result;
    } catch (e) {
      log(e.toString());
      throw MyAppException(
        title: 'Error fetching nearby posts',
        message: e.toString(),
      );
    }
  }

  //  Future<List<PostModel>> latestbuyTymPosts() async {
  //   try {
  //     final data = await FirebaseFirestore.instance
  //         .collection("buyTymPost")
  //         .orderBy("postDate", descending: false)
  //         .get();
  //     final List<PostModel> result = data.docs
  //         .map(
  //           (doc) => PostModel.fromMap(doc.data(), postId: doc.id),
  //         )
  //         .toList();
  //     log(result.toString());
  //     return result;
  //   } catch (e) {
  //     log(e.toString());
  //     throw MyAppException(
  //       title: toString(),
  //       message: toString(),
  //     );
  //   }
  // }

  Future<List<PostModel>> sellTymPosts() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("sellTymPost")
          .orderBy("postDate", descending: true)
          .get();

      final List<PostModel> result = data.docs
          .map(
            (doc) => PostModel.fromMap(doc.data(), postId: doc.id),
          )
          .toList();
      // log(result.toString());
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
