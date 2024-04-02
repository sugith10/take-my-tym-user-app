import 'package:take_my_tym/features/auth/data/datasources/remote/social_auth_remote_data.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/repositories/social_auth_repo.dart';

class SocialAuthRepoImpl implements SocialAuthRepo {
  final SocailAuthRemoteData _remoteDataSource;

  SocialAuthRepoImpl(this._remoteDataSource);

  @override
  Future<AppUserModel> googleSign() async {
    return _remoteDataSource.signInWithGoogle();
  }
}
