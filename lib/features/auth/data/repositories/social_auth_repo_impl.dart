import 'package:take_my_tym/features/auth/data/datasources/remote/social_auth_remote_data.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/repositories/social_auth_repo.dart';

// Implementation of SocialAuthRepository
class SocialAuthRepoImpl implements SocialAuthRepo {
  final SocailAuthRemoteData _remoteDataSource;

  SocialAuthRepoImpl(this._remoteDataSource);

  @override
  // A method that signs in with Google
  Future<UserModel> googleSign() async {
    return _remoteDataSource.signInWithGoogle();
  }
}
