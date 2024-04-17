import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class UpdateProfileRemote {
  Future<void> updateProfile({
    required AppUserModel appUserModel,
    required File? profilePicture,
  }) async {
    log("on remote update profile");
    try {
      if (profilePicture != null) {
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference storageRef =
            storage.ref().child('profilePictures/${DateTime.now().toString()}');
        UploadTask uploadTask = storageRef.putFile(profilePicture);
        TaskSnapshot storageSnapshot =
            await uploadTask.whenComplete(() => null);

        await storageSnapshot.ref.getDownloadURL().then((value) async {
          appUserModel.picture = value;
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          await firestore
              .collection('users')
              .doc(appUserModel.uid)
              .update(appUserModel.toMap())
              .then((value) async {
            log("success update");
          });
        });
      } else {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection('users')
            .doc(appUserModel.uid)
            .update(appUserModel.toMap())
            .then((value) async {
          log("success update without image");
        });
      }
    } catch (e) {
      log(e.toString());
      throw (MyAppException(message: e.toString()));
    }
  }
}
