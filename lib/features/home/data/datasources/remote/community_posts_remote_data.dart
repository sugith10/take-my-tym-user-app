import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';

class CommunityPostsRemoteData {
  Future<List<PostModel>> latestbuyTymPosts({
    required String uid,
  }) async {
    try {
      final data = await FirebaseFirestore.instance
          .collection("buyTymPost")
          .where("uid", isNotEqualTo: uid)
          .orderBy("uid")
          .orderBy("postDate", descending: true)
          .get();
      final List<PostModel> result = data.docs
          .map(
            (doc) => PostModel.fromMap(doc.data(), postId: doc.id),
          )
          .toList();
      return result;
    } catch (e) {
      appLogger.e(e);
      throw AppException(
        alert: toString(),
        details: toString(),
      );
    }
  }

  Future<List<PostModel>> getRemoteBuyTymPosts({
    required String uid,
  }) async {
    try {
      final query = FirebaseFirestore.instance
          .collection('buyTymPost')
          .where('workType', isEqualTo: 'Remote')
           .where("uid", isNotEqualTo: uid)
          .orderBy("uid")
          .orderBy("postDate", descending: true);

      final snapshot = await query.get();

      final List<PostModel> result = snapshot.docs
          .map((doc) => PostModel.fromMap(doc.data(), postId: doc.id))
          .toList();

      return result;
    } catch (e) {
      throw AppException(
        alert: 'Error fetching remote buyTymPosts',
        details: e.toString(),
      );
    }
  }

  Future<List<PostModel>> getOnsiteBuyTymPosts({
    required String uid,
  }) async {
    try {
      final query = FirebaseFirestore.instance
          .collection('buyTymPost')
          .where('workType', isEqualTo: 'On-site')
          .where("uid", isNotEqualTo: uid)
          .orderBy("uid")
          .orderBy("postDate", descending: true);

      final snapshot = await query.get();

      final List<PostModel> result = snapshot.docs
          .map((doc) => PostModel.fromMap(doc.data(), postId: doc.id))
          .toList();

      return result;
    } catch (e) {
      throw AppException(
        alert: 'Error fetching remote buyTymPosts',
        details: e.toString(),
      );
    }
  }

  Future<List<PostModel>> getNearbyBuyTymPosts({
    required double latitude,
    required double longitude,
    required double range,
  }) async {
    try {
      range = 25;
      final double latRange =
          0.01449275362 * range; // 1 degree latitude is approximately 111.32 km

      final query = FirebaseFirestore.instance
          .collection('buyTymPost')
          .where('latitude', isGreaterThan: latitude + latRange)
          .where('latitude', isLessThan: latitude - latRange);

      final snapshot = await query.get();

      final List<PostModel> result = snapshot.docs
          .map((doc) => PostModel.fromMap(doc.data(), postId: doc.id))
          .toList();
      print(result);

      return result;
    } catch (e) {
      print(e.toString());
      throw AppException(
        alert: 'Error fetching nearby buyTymPosts',
        details: e.toString(),
      );
    }
  }

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
      throw AppException(
        alert: toString(),
        details: toString(),
      );
    }
  }
}

class Distance {
  final double meters;

  Distance({required this.meters});
}
