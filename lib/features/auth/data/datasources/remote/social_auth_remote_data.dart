import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

final class SocailAuthRemoteData{
    ///GOOGLE SIGNIN
  Future<AuthUserModel> signInWithGoogle() async {
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
        await userDocRef.set(AuthUserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email ?? "",
          firstName: userCredential.user!.displayName?.split(' ').first,
          lastName: userCredential.user!.displayName?.split(' ').last,
        ).toJson());
      }
      print("user name: ${userCredential.user!.displayName}");
      AuthUserModel userModel =
          AuthUserModel(email: userCredential.user?.email);
      return userModel;
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