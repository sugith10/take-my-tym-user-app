import 'package:take_my_tym/features/auth/data/datasources/remote/sign_in_remote_data.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signin_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final SignInRemoteData _remoteDataSource;

  SignInRepoImpl(this._remoteDataSource);

  @override
  Future<AuthUserModel> authenticateUser(String email, String password) {
    return _remoteDataSource.emailSignIn(email, password);
  }
}
