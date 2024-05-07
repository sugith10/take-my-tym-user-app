import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class UpdateProfileRemote {
  Future<void> updateProfile({
    required UserModel UserModel,
    required XFile? image,
  }) async {
    log("on remote update profile");
    try {
      if (image != null) {
        final ref = FirebaseStorage.instance.ref('users/profile/image').child(image.name);
        await ref.putFile(File(image.path));

        await ref.getDownloadURL().then((value) async {
          UserModel.picture = value;
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          await firestore
              .collection('users')
              .doc(UserModel.uid)
              .update(UserModel.toMap())
              .then((value) async {
            log("success update");
          });
        });
      } else {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection('users')
            .doc(UserModel.uid)
            .update(UserModel.toMap())
            .then((value) async {
          log("success update without image");
        });
      }
    } catch (e) {
      log(e.toString());
      throw (AppException(alert: e.toString()));
    }
  }
}
