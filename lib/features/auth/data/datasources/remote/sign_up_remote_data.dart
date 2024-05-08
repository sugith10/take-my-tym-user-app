import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';

final class SignUpRemoteData {
  Future<UserModel> createUserWithEmail({
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
        throw const AppException(
          alert: 'Sign Up Failed',
          details: 'An error occurred during user creation. Please try again.',
        );
      }

      final userDocRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      UserModel userModel = UserModel(
        uid: user.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        userName: firstName + lastName,
        verified: false,
        blocked: false
      );
      try {
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          transaction.set(
            userDocRef,
            userModel.toMap(),
          );
        });

        return userModel;
      } catch (e) {
        log(e.toString());
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const AppException(
          alert: 'Network Error',
          details: "Please check your internet connection and try again.",
        );
      } else if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        throw const AppException(
            alert: 'user-not-found',
            details: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        throw const AppException(
          alert: 'Account Already Exists',
          details: 'An account with this email already exists.',
        );
      } else {
        log('excpetion occured');
        log(e.toString());
        throw const AppException(
            alert: 'check firebase exception',
            details: 'Check RemoteDataSource');
      }
    } on Exception catch (e) {
      log(e.toString());
      throw const AppException(
        alert: 'Something went wrong',
        details: 'Check RemoteDataSource',
      );
    }
  }
}
