import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

/// Remote data source for resetting the user's password
class ForgetPasswordRemoteData {
  // Firebase Auth API to send a password reset email to the provided email
  Future<void> resetPassword(String email) async {
    try {
      // Send the password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Throw an AppException with the error details and an alert message
      throw AppException(details: e.toString(), alert: e.toString());
    }
  }
}
