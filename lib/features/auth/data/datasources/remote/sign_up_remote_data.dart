import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/util/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/util/text_manipulator/taxt_manipulator.dart';

//class to manage remote data for sign up
class SignUpRemoteData {
  ///Create a user with email
  Future<UserModel> createUserWithEmail({
    required String firstName,
    required String email,
    required String password,
  }) async {
    try {
      //Firebase Auth API to create user with email and password
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //get user from credential
      final user = credential.user;

      //check if user is null
      if (user == null) {
        throw const AppException(
          alert: 'Sign Up Failed',
          details: 'An error occurred during user creation. Please try again.',
        );
      }

      //get user doc ref
      final userDocRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      //create user model
      UserModel userModel = UserModel(
        uid: user.uid,
        email: email,
        userName: firstName,
        verified: false,
        blocked: false,
        join: TextManipulator.joinDate(date: DateTime.now()),
      );
      try {
        //run transaction to set user model
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          transaction.set(
            userDocRef,
            userModel.toMap(),
          );
        });

        //return user model
        return userModel;
      } catch (e) {
        log(e.toString());
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      // Check if the error is due to a network request failure
      if (e.code == 'network-request-failed') {
        throw const AppException(
          alert: 'Network Error',
          details: "Please check your internet connection and try again.",
        );
        // Check if the error is due to a weak password
      } else if (e.code == 'weak-password') {
        throw const AppException(
            alert: 'user-not-found',
            details: 'The password provided is too weak.');
        // Check if the error is due to an account already existing with the given email
      } else if (e.code == 'email-already-in-use') {
        throw const AppException(
          alert: 'Account Already Exists',
          details: 'An account with this email already exists.',
        );
        // Handle any other errors
      } else {
        throw const AppException();
      }
    }
  }
}
