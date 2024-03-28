import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteDataSource {
  ///EMAIL SIGNIN
  Future<AuthUserModel> authenticateUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AuthUserModel(email: credential.user?.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        throw const MyAppException(
          title: 'user-not-found',
          message: 'Check RemoteDataSource',
        );
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        throw const MyAppException(
          title: 'wrong-password',
          message: 'Check RemoteDataSource',
        );
      } else if (e.code == 'invalid-credential') {
        throw const MyAppException(
          title: 'Invalid credentials.',
          message: 'Please check your username and password and try again.',
        );
      } else if (e.code == 'too-many-requests') {
        throw const MyAppException(
          title: 'Too Many Requests',
          message:
              'We\'re experiencing a high volume of requests. Please try again later...',
        );
      } else {
        log(e.code);
        log(e.toString());
        throw MyAppException(
          title: e.code,
          message: 'Check RemoteDataSource',
        );
      }
    } on Exception catch (e) {
      log(e.toString());
      throw const MyAppException(
        title: 'Something went wrong',
        message: 'Check RemoteDataSource',
      );
    }
  }

  ///EMAIL SIGNUP
  Future<AuthUserModel> createUser({
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
                  lastName: lastName)
              .toJson(),
        );
      });

      return AuthUserModel(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
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

  ///GOOGLE SIGNIN
  Future<AuthUserModel> signInWithGoogle() async {
    log('one socail auth');
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      AuthUserModel userModel =
          AuthUserModel(email: userCredential.user?.email);
      // log("firebase result: - ${userCredential.toString()}");
      // log('');
      // log(userModel.toString());
      return userModel;
    } catch (e) {
      log(e.toString());
      throw const MyAppException(
        title: 'Something Went Wrong',
        message: 'Google auth went wrong',
      );
    }
  }
}
