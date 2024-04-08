import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';

final class SocailAuthRemoteData {
  ///GOOGLE SIGNIN
  Future<AppUserModel> signInWithGoogle() async {
    log('one socail auth');
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw const MyAppException(
          title: 'Sign In Cancelled',
          message: 'The user cancelled the Google sign-in process.',
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final userDocRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid);

      final userDocSnapshot = await userDocRef.get();
      if (!userDocSnapshot.exists) {
        final AppUserModel userModel = AppUserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email ?? "",
          firstName: userCredential.user!.displayName?.split(' ').first ?? 'User',
          lastName: userCredential.user!.displayName?.split(' ').last ?? " ",
          verified: true,
          userName: userCredential.user!.displayName?.split(' ').first ?? 'User',
        );
        await userDocRef.set(userModel.toJson());
        return userModel;
      } else {
        final Map<String, dynamic> userData =
            userDocSnapshot.data() as Map<String, dynamic>;
        AppUserModel userModel = AppUserModel.fromMap(userData);
        log(userModel.toString());
        return userModel;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const MyAppException(
            title: 'Network Error',
            message: "Please check your internet connection and try again.");
      } else {
        throw const MyAppException(
          title: 'Authentication Failed',
          message:
              'Failed to authenticate with Google. Please try again later.',
        );
      }
    } on Exception catch (e) {
      log(e.toString());
      throw const MyAppException(
        title: 'Authentication Failed',
        message: 'Failed to authenticate with Google. Please try again later.',
      );
    }
  }
}
