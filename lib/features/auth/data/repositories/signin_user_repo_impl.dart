import 'package:take_my_tym/features/auth/data/datasources/remote_data_source.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signin_user_repo.dart';

class SignInRepoImpl implements SignInRepo{
  final RemoteDataSource _remoteDataSource;

  SignInRepoImpl(this._remoteDataSource);

  @override
  Future<AuthUserModel> authenticateUser(String email, String password) {
   return _remoteDataSource.authenticateUser(email, password);
  }

  
}