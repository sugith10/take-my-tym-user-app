import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signin_repo.dart';

//Create user usecase
class SignInUseCase {
  final SignInRepo _signInRepo;

  SignInUseCase(this._signInRepo);

  Future<AppUserModel> authenticateUser(
    String email,
    String password,
  ) async {
    return await _signInRepo.authenticateUser(
      email,
      password,
    );
  }
}
