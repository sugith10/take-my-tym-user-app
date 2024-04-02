import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class SignOutRemoteData{
    Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
       log('Signed out successfully!');
    } catch (e) {
      throw const MyAppException(
        title: 'Something Went Wrong',
        message: 'Google auth went wrong',
      );
    }
  }
}