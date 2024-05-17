import 'package:take_my_tym/features/auth/data/datasources/remote/forget_password_remote_data.dart';
import 'package:take_my_tym/features/auth/domain/repositories/forget_password_repo.dart';

// Implementation of the ForgetPasswordRepository
final class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  // Create a final variable called _remoteData that implements the RemoteData interface
  final ForgetPasswordRemoteData _remoteData;
  // Create a constructor that takes in the _remoteData parameter
  ForgetPasswordRepoImpl(this._remoteData);

  // Create a method that takes in a String email as a parameter and resets the password
  @override
  Future<void> resetPassword({required String email}) async {
    // Call the resetPassword method on the _remoteData variable with the email parameter
    await _remoteData.resetPassword(email);
  }
} 