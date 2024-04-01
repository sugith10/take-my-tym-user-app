import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';

final class CreatePostRemoteData {
  Future<bool> buyTymPost({required PostModel postModel}) async {
    try {
      final buyTymPost = FirebaseFirestore.instance.collection('buyTymPost');
      await buyTymPost.add(postModel.toMap());
      log("Data added successfully in buyTymPost - message from create post remote data");
      return true;
    } catch (e) {
      log('Error adding data to buyTymPost: $e');
      throw const MyAppException(
          message: 'Failed to add data to buyTymPost',
          title: 'Remote data adding failed');
    }
  }

  Future<bool> sellTymPost({required PostModel postModel}) async {
    try {
      final sellTymPost = FirebaseFirestore.instance.collection('sellTymPost');
      await sellTymPost.add(postModel.toMap());
      return true;
    } on FirebaseException catch (e) {
      log('Firebase Exception: $e');
      throw MyAppException(
        message: e.message ?? 'Unknown error occurred',
        title: 'Firebase Exception',
      );
    } catch (e) {
      log('Unknown Exception: $e');
      throw const MyAppException(
          message: 'Unknown error occurred', title: 'Unknown Exception');
    }
  }
}
