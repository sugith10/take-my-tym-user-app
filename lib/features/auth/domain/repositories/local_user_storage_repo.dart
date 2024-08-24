import 'package:take_my_tym/core/model/app_user_model.dart';

abstract interface class LocalUserDataRepo{
  Future<void> storeUserDataLocal(UserModel user);

  Future<UserModel?> getUserDataFromLocal();

  Future<void> userSignOutFromLocal();
}