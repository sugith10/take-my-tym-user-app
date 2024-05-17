import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/model/app_user_model.dart';

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

        // Return the user model
        return authUser;
      } else {
        // Throw an exception if the user does not exist
        throw Exception();
      }
    } catch (e) {
      // Throw an exception if any error occurs
      throw Exception(e);
    }
  }
}
