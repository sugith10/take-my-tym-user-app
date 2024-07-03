import 'package:take_my_tym/features/auth/data/datasources/remote/sign_out_remote_data.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signout_repo.dart';

import '../../../../core/utils/app_exception.dart';

// Implementation of the SignOutRepository
class SignOutRepoImp implements SignOutRepo {
  final SignOutRemoteData _remoteDataSource;

  SignOutRepoImp(this._remoteDataSource);
  // Method to sign out the user
  @override
  Future<void> signOut() async {
    try {
      // Sign out the user from the remote data source
      await _remoteDataSource.signOut();
    } catch (e) {
      // Throw an exception if any error occurs
      throw const AppException();
    }
  }
}
