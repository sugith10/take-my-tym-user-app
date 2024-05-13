import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/model/app_user_model.dart';
import '../../../../../core/utils/app_exception.dart';
import '../../../../../core/utils/app_logger.dart';

final class ProfileRemote {
  Future<void> updateProfile({
    required UserModel userModel,
    required XFile? image,
  }) async {
    log("on remote update profile");
    try {
      if (image != null) {
        final ref = FirebaseStorage.instance.ref('users/profile/image').child(image.name);
        await ref.putFile(File(image.path));

        await ref.getDownloadURL().then((value) async {
          userModel.picture = value;
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          await firestore
              .collection('users')
              .doc(userModel.uid)
              .update(userModel.toMap())
              .then((value) async {
            log("success update");
          });
        });
      } else {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection('users')
            .doc(userModel.uid)
            .update(userModel.toMap())
            .then((value) async {
          log("success update without image");
        });
      }
    } catch (e) {
      log(e.toString());
      throw (AppException(alert: e.toString()));
    }
  }

  Future<UserModel> getProfile({required String userId}) async {
    try {
      final collection = FirebaseFirestore.instance.collection("users");
      final userRef = await collection.doc(userId).get();
      if (userRef.exists) {
        final usermodel = UserModel.fromMap(userRef.data()!);
        return usermodel;
      } else {
        throw const AppException();
      }
    } catch (e) {
      appLogger.e(e.toString());
      throw const AppException();
    }
  }
}
