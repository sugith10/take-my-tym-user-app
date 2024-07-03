import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/model/app_user_model.dart';
import '../../../../core/utils/app_exception.dart';
import '../../domain/repositories/signin_repo.dart';
import '../datasources/remote/sign_in_remote_data.dart';

// Implementation of SignInRepository
class SignInRepoImpl implements SignInRepo {
  final SignInRemoteData _remoteDataSource;

  SignInRepoImpl(this._remoteDataSource);

  // Method to authenticate a user
  @override
  Future<UserModel> authenticateUser(String email, String password) {
    try {
      // Method to authenticate the user
      return _remoteDataSource.emailSignIn(email, password);
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
