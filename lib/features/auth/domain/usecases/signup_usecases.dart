import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signup_user_repo.dart';

//Create user usecase
class SignUpUseCase {
  final SignUpRepo _signUpRepo;

  SignUpUseCase(this._signUpRepo);

  Future<AuthUserModel> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return await _signUpRepo.createUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
}
