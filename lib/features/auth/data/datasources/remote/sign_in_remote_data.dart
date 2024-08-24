import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/util/app_logger.dart';

import '../../../../../core/model/app_user_model.dart';
import '../../../../../core/util/app_exception.dart';

/// Remote data source for sign in with email and password
class SignInRemoteData {
  ///  Sign in with email and password
  Future<UserModel> emailSignIn(String email, String password) async {
    try {
      // /Firebase Auth API to Sign in with email and password
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Get the user document from Firebase Firestore
      final userDocRef = FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid);

      // Get the user snapshot from Firebase Firestore
      DocumentSnapshot userSnapshot = await userDocRef.get();

      // If the user snapshot exists
      if (userSnapshot.exists) {
        // Get the data from the user snapshot
        final data = userSnapshot.data() as Map<String, dynamic>;
        // Create a user model from the data
        final authUser = UserModel.fromMap(data);
        appLogger.d('User signed in successfully');
        // Return the user model
        return authUser;
      } else {
        // Throw an exception if the user does not exist
        appLogger.d("User does not exist");
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      // Check the FirebaseAuthException code
      if (e.code == 'network-request-failed') {
        throw const AppException(
            alert: 'Network Error',
            details: "Please check your internet connection and try again.");
      } else if (e.code == 'user-not-found') {
        throw const AppException(
          alert: 'user-not-found',
          details: 'Check RemoteDataSource',
        );
      } else if (e.code == 'wrong-password') {
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
        // If any other exception, throw an AppException
        throw const AppException(
          alert: 'User Not Found',
          details: 'Please check the provided details.',
        );
      }
    }
  }
}
