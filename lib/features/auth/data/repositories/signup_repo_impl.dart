import 'package:take_my_tym/features/auth/data/datasources/remote/sign_up_remote_data.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signup_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteData _remoteDataSource;

  SignUpRepoImpl(this._remoteDataSource);
  @override
  Future<AppUserModel> createUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    return _remoteDataSource.createUserWithEmail(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
}
