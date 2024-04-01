import 'package:take_my_tym/features/auth/domain/repositories/forget_password_repo.dart';

final class ForgetPasswordUseCase{
  final ForgetPasswordRepo _forgetPasswordRepo;
  ForgetPasswordUseCase(this._forgetPasswordRepo);

  Future<void>resetPassword({required String email})async{
    await _forgetPasswordRepo.resetPassword(email: email);
  }
}