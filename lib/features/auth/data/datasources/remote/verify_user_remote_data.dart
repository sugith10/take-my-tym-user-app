import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';

final class VerifyUserRemoteData {
  Future<AppUserModel> sendEmailVerification({
    required User user,
    required AppUserModel userModel,
  }) async {
    try {
      await user.sendEmailVerification();
      if (user.emailVerified) {
        userModel.verified = true;
        return userModel;
      }else{
        return userModel;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const MyAppException(
          title: "The user does not exist.",
          message: "Please recheck email.",
        );
      } else {
        throw const MyAppException(
          title: "The user does not exist.",
          message: "Please recheck email.",
        );
      }
    } catch (e) {
      throw const MyAppException();
    }
  }
}
