import 'package:take_my_tym/features/auth/domain/repositories/signout_repo.dart';

class SignOutUseCase{
  final SignOutRepo _signOutRepo;

  SignOutUseCase(this. _signOutRepo);

  Future<void> signOutUser()async{
    await _signOutRepo.signOut();
  }
}