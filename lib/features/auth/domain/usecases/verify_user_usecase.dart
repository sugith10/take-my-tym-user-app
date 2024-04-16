import 'package:take_my_tym/features/auth/domain/repositories/verify_user_repo.dart';

final class VerifyUserUseCase {
  final VerifyUserRepo _verifyUserRepo;

  VerifyUserUseCase(this._verifyUserRepo);

  Future<void> verifyUserEmail() async {
    await _verifyUserRepo.verifyUserEmail();
  }

  Future<bool> checkUserVerified() async {
   return await _verifyUserRepo.checkUserVerified();
  }
}
