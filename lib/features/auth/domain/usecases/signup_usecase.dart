import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signup_repo.dart';

//Create user usecase
class SignUpUseCase {
  final SignUpRepo _signUpRepo;

  SignUpUseCase(this._signUpRepo);

  Future<UserModel> createUser({
    required String firstName,

    required String email,
    required String password,
  }) async {
    return await _signUpRepo.createUser(
      firstName: firstName,

      email: email,
      password: password,
    );
  }
}
