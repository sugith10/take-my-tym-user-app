import 'package:take_my_tym/features/auth/data/datasources/remote/verify_user_remote_data.dart';
import 'package:take_my_tym/features/auth/domain/repositories/verify_user_repo.dart';

final class VerifyUserRepoImpl implements VerifyUserRepo {
  final VerifyUserRemote _verifyUserRemote;
  VerifyUserRepoImpl(this._verifyUserRemote);

  @override
  Future<void> verifyUserEmail() async{
    return await _verifyUserRemote.sendEmailVerification();
  }
  
  @override
  Future<bool> checkUserVerified() async{
   
  return await _verifyUserRemote.checkUserVerified();
  }
}
