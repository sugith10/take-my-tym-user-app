import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/features/auth/data/datasources/remote/verify_user_remote_data.dart';
import 'package:take_my_tym/features/auth/domain/repositories/verify_user_repo.dart';

import '../../../../core/utils/app_exception.dart';

// Implementation of VerifyUserRepository
final class VerifyUserRepoImpl implements VerifyUserRepo {
  // RemoteDataSource to be used for verify user
  final VerifyUserRemote _verifyUserRemote;

  VerifyUserRepoImpl(this._verifyUserRemote);

  //METHOD TO SEND AN EMAIL VERIFICATION
  @override
  Future<void> verifyUserEmail() async{
    try{

    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const AppException(
          alert: "The user does not exist.",
          details: "Please recheck email.",
        );
      } else {
        throw const AppException(
          alert: "The user does not exist.",
          details: "Please recheck email.",
        );
      }
    } 
    

    return await _verifyUserRemote.sendEmailVerification();
  }
  
  //METHOD TO CHECK IF THE USER IS VERIFIED
  @override
  Future<bool> checkUserVerified() async{

    return await _verifyUserRemote.checkUserVerified();
  }
}
