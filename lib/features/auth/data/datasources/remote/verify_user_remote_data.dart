import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class VerifyUserRemote {
  Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const MyAppException(
          title: "The user does not exist.",
          message: "Please recheck email.",
        );
      } else {
        throw const MyAppException(
          title: "The user does not exist.",
          message: "Please recheck email.",
        );
      }
    } catch (e) {
      throw const MyAppException();
    }
  }

  Future<bool> checkUserVerified() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.reload();
      bool verified = user.emailVerified;
      log("user is verified: $verified");
      if (verified) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'verified': true});
      }
      return verified;
    } catch (e) {
      log(e.toString());
      throw MyAppException(title: e.toString(), message: e.toString());
    }
  }
}
