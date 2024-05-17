import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';

//class to manage remote data for sign up
final class SignUpRemoteData {
  ///Create a user with email
  Future<UserModel> createUserWithEmail({
    required String firstName,
    required String lastName,
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
          firstName: firstName,
          lastName: lastName,
          userName: firstName + lastName,
          verified: false,
          blocked: false);
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
    } on Exception {
      throw Exception();
    }
  }
}