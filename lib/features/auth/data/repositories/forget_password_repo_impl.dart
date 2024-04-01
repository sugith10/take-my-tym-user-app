import 'package:take_my_tym/features/auth/data/datasources/remote/forget_password_remote_data.dart';
import 'package:take_my_tym/features/auth/domain/repositories/forget_password_repo.dart';

final class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordRemoteData _remoteData;
  ForgetPasswordRepoImpl(this._remoteData);

  @override
  Future<void> resetPassword({required String email}) async {
    await _remoteData.resetPassword(email);
  }
}
