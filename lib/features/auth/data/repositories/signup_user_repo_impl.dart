import 'package:take_my_tym/features/auth/data/datasources/remote_data_source.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signup_user_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final RemoteDataSource _remoteDataSource;

  SignUpRepoImpl(this._remoteDataSource);
  @override
  Future<AuthUserModel> createUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    return _remoteDataSource.createUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
}
