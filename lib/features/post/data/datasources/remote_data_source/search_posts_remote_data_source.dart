import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';

final class SearchPostsRemoteData {
  Stream<List<PostModel>> searchBuyTymPost({required String search}) async* {
     log('Searching buy-tym posts for: $search');
    try {
     final queryBuyTymPostStream = FirebaseFirestore.instance
    .collection('buyTymPost').orderBy('title').startAt([search]).endAt([search+'\uf8ff'])
    // .where('title', isGreaterThanOrEqualTo: search)
    // .where('title', isLessThan: '$search\uf8ff')
    .snapshots();

      await for (final querySnapshot in queryBuyTymPostStream) {
        final results = querySnapshot.docs
            .map((doc) => PostModel.fromMap(doc.data(), postId: doc.id))
            .toList();
        log("SEARCH RESULT ${results.toString()}");
      
        yield results;
      }
    } catch (e) {
      log(e.toString());
      throw const MyAppException();
    }
  }
}
