import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class ForgetPasswordRemoteData {
  Future<void> resetPassword(String email) async {
    try {
      log("on resetPassword -> $email");
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(const AppException().toString());
      throw AppException(details: e.toString(), alert: e.toString());
    }
  }
}
