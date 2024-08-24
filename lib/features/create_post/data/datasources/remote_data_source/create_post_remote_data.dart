import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/util/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';

final class CreatePostRemoteData {
  Future<bool> buyTymPost({required PostModel postModel}) async {
    try {
      final buyTymPost = FirebaseFirestore.instance.collection('buyTymPost');
      await buyTymPost.add(postModel.toMap());

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
      //  log("Data added successfully in sellTymPost - message from create post remote data");
      final buyTymPost = FirebaseFirestore.instance.collection('sellTymPost');
      await buyTymPost.add(postModel.toMap());

      // log("Data added successfully in sellTymPost - message from create post remote data");
      return true;
    } on FirebaseException catch (e) {
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
