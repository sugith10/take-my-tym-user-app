import 'package:firebase_auth/firebase_auth.dart';

/// Remote data source for handle sign-out operation
final class SignOutRemoteData {
  // A method to sign the user out of the application
  Future<void> signOut() async {
    try {
       //Firebase Auth API to sign the user out of the application
      await FirebaseAuth.instance.signOut().then((value) {
        return;
      });
    } catch (e) {
      // Throw an exception if an error occurs
      throw Exception(e);
    }
  }
}
