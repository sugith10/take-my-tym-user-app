import '../../../../core/model/app_user_model.dart';
import '../../domain/repositories/signin_repo.dart';
import '../datasources/remote/sign_in_remote_data.dart';

// Implementation of SignInRepository
class SignInRepoImpl implements SignInRepo {
  final SignInRemoteData _remoteDataSource;

  SignInRepoImpl(this._remoteDataSource);

  // Method to authenticate a user
  @override
  Future<UserModel> authenticateUser(String email, String password) {
    // Method to authenticate the user
    return _remoteDataSource.emailSignIn(email, password);
  }
}