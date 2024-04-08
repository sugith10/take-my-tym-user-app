import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class UpdateProfileRemoteData {
  Future<void> updateProfile({
    required AppUserModel appUserModel,
    required File? image,
  }) async {
    try {
      if (image != null) {
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference storageRef =
            storage.ref().child('images/${DateTime.now().toString()}');
        UploadTask uploadTask = storageRef.putFile(image);
        TaskSnapshot storageSnapshot =
            await uploadTask.whenComplete(() => null);

        await storageSnapshot.ref.getDownloadURL().then((value) async {
          appUserModel.picture = value;
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          await firestore
              .collection('users')
              .doc(appUserModel.uid)
              .update(appUserModel.toJson())
              .then((value) async {
            log("success update");
          });
        });
      } else {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection('users')
            .doc(appUserModel.uid)
            .update(appUserModel.toJson())
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
