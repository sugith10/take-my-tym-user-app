import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

final class SignUpRemoteData{
   ///EMAIL SIGNUP
  Future<AuthUserModel> createUserWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = credential.user;

      if (user == null) {
        throw const MyAppException(
          title: 'Sign Up Failed',
          message: 'An error occurred during user creation. Please try again.',
        );
      }

      final userDocRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(
          userDocRef,
          AuthUserModel(
            uid: user.uid,
            email: email,
            firstName: firstName,
            lastName: lastName,
          ).toJson(),
        );
      });

      return AuthUserModel(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const MyAppException(
          title: 'Network Error',
          message: "Please check your internet connection and try again.",
        );
      } else if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        throw const MyAppException(
            title: 'user-not-found',
            message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        throw const MyAppException(
          title: 'user-not-found',
          message: 'The password provided is too weak.',
        );
      } else {
        log('excpetion occured');
        log(e.toString());
        throw const MyAppException(
            title: 'check firebase exception',
            message: 'Check RemoteDataSource');
      }
    } on Exception catch (e) {
      log(e.toString());
      throw const MyAppException(
        title: 'Something went wrong',
        message: 'Check RemoteDataSource',
      );
    }
  }

}