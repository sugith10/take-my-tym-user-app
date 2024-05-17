import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/model/app_user_model.dart';
import '../../../../core/utils/app_exception.dart';
import '../../domain/repositories/signup_repo.dart';
import '../datasources/remote/sign_up_remote_data.dart';

// Class to implement the SignUpRepo interface
class SignUpRepoImpl implements SignUpRepo {
  // Remote data source to be used for the implementation
  final SignUpRemoteData _remoteDataSource;

  // Constructor for the SignUpRepoImpl class
  SignUpRepoImpl(this._remoteDataSource);

  // Override method to create a new user
  @override
  Future<UserModel> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      // Call the createUserWithEmail method from the remote data source
      return _remoteDataSource.createUserWithEmail(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // Check if the error is due to a network request failure
      if (e.code == 'network-request-failed') {
        throw const AppException(
          alert: 'Network Error',
          details: "Please check your internet connection and try again.",
        );
        // Check if the error is due to a weak password
      } else if (e.code == 'weak-password') {
        throw const AppException(
            alert: 'user-not-found',
            details: 'The password provided is too weak.');
        // Check if the error is due to an account already existing with the given email
      } else if (e.code == 'email-already-in-use') {
        throw const AppException(
          alert: 'Account Already Exists',
          details: 'An account with this email already exists.',
        );
        // Handle any other errors
      } else {
        throw const AppException();
      }
    }
  }
}
