import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';

class SignInRemoteData {
  ///EMAIL SIGNIN
  Future<AppUserModel> emailSignIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final userDocRef = FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid);

      log(credential.user!.uid);
      DocumentSnapshot userSnapshot = await userDocRef.get();
      log(userSnapshot.toString());

      if (userSnapshot.exists) {
        final data = userSnapshot.data() as Map<String, dynamic>;
        final authUser = AppUserModel.fromMap(data);
        log(authUser.toString());
        
        return authUser;
      } else {
        log('User data does not exist in Firestore.');
        throw const AppException(
          alert: 'user-not-found',
          details: 'Check RemoteDataSource',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const AppException(
            alert: 'Network Error',
            details: "Please check your internet connection and try again.");
      } else if (e.code == 'user-not-found') {
        log('No user found for that email.');
        throw const AppException(
          alert: 'user-not-found',
          details: 'Check RemoteDataSource',
        );
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        throw const AppException(
          alert: 'wrong-password',
          details: 'Check RemoteDataSource',
        );
      } else if (e.code == 'invalid-credential') {
        throw const AppException(
          alert: 'Invalid credentials.',
          details: 'Please check your username and password and try again.',
        );
      } else if (e.code == 'too-many-requests') {
        throw const AppException(
          alert: 'Too Many Requests',
          details:
              'We\'re experiencing a high volume of requests. Please try again later...',
        );
      } else {
        log(e.code);
        log(e.toString());
        throw AppException(
          alert: e.code,
          details: 'Check RemoteDataSource',
        );
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
