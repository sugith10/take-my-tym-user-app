import 'dart:developer';

import 'package:take_my_tym/features/auth/data/datasources/remote_data_source.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/repositories/social_auth_repo.dart';

class SocialAuthRepoImpl implements SocialAuthRepo {
  final RemoteDataSource _remoteDataSource;

  SocialAuthRepoImpl(this._remoteDataSource);

  @override
  Future<AuthUserModel> googleSign()async {
    final userModel = await _remoteDataSource.signInWithGoogle();
    log('SocialAuthRepoImpl $userModel');
    return userModel;
  }
}
