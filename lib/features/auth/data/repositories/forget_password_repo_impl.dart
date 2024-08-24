import 'package:take_my_tym/features/auth/data/datasources/remote/forget_password_remote_data.dart';
import 'package:take_my_tym/features/auth/domain/repositories/forget_password_repo.dart';

// Implementation of the ForgetPasswordRepository
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordRemoteData _remoteData;

  ForgetPasswordRepoImpl(this._remoteData);

  @override
  Future<void> resetPassword({required String email}) async {
    // Call the resetPassword method on the _remoteData variable with the email parameter
    await _remoteData.resetPassword(email);
  }
}
