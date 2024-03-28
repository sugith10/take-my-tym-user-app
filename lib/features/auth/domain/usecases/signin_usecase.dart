import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/repositories/signin_repo.dart';

//Create user usecase
class SignInUseCase {
  final SignInRepo _signInRepo;

  SignInUseCase(this._signInRepo);

  Future<AuthUserModel> authenticateUser(
    String email,
    String password,
  ) async {
    return await _signInRepo.authenticateUser(
      email,
      password,
    );
  }
}
