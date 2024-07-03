import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';

/// Remote data source for handle sign-out operation
class SignOutRemoteData {
  // A method to sign the user out of the application
  Future<void> signOut() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Check if the user signed in with Google
        bool isGoogleSignIn = user.providerData
            .any((userInfo) => userInfo.providerId == 'google.com');

        // Firebase Auth API to sign the user out of the application
        await FirebaseAuth.instance.signOut();

        // Google Sign In API to disconnect the user from Google Sign In, if signed in with Google
        if (isGoogleSignIn) {
          await GoogleSignIn().disconnect();
        }
      }
    } catch (e) {
      // Throw an exception if an error occurs
      appLogger.e(e.toString());
      throw Exception(e);
    }
  }
}
