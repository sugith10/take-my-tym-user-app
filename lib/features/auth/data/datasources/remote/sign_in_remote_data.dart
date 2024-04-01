import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

class SignInRemoteData{
   ///EMAIL SIGNIN
  Future<AuthUserModel> emailSignIn(String email, String password) async {
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
        final authUser = AuthUserModel.fromMap(data);
        log(authUser.toString());
        return authUser;
      } else {
        log('User data does not exist in Firestore.');
        throw const MyAppException(
          title: 'user-not-found',
          message: 'Check RemoteDataSource',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const MyAppException(
            title: 'Network Error',
            message: "Please check your internet connection and try again.");
      } else if (e.code == 'user-not-found') {
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
}