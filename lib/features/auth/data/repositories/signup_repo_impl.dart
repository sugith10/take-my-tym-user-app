import '../../../../core/model/app_user_model.dart';
import '../../domain/repositories/signup_repo.dart';
import '../datasources/remote/sign_up_remote_data.dart';

// Class to implement the SignUpRepo interface
class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteData _remoteDataSource;

  SignUpRepoImpl(this._remoteDataSource);

  // Override method to create a new user
  @override
  Future<UserModel> createUser({
    required String firstName,

    required String email,
    required String password,
  }) async {

      // Call the createUserWithEmail method from the remote data source
      return _remoteDataSource.createUserWithEmail(
        firstName: firstName,
   
        email: email,
        password: password,
      );

  }
}
