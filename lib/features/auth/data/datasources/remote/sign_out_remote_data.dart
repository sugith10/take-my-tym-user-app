import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class SignOutRemoteData {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        return;
      });
      log('Signed out successfully!');
    } catch (e) {
      throw const AppException(
        alert: 'Something Went Wrong',
        details: 'Google auth went wrong',
      );
    }
  }
}
