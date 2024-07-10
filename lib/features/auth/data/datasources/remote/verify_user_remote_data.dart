import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/util/app_exception.dart';

final class VerifyUserRemote {
  Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      return;
    }  catch (e) {
      throw const AppException();
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
      throw AppException(alert: e.toString(), details: e.toString());
    }
  }
}
