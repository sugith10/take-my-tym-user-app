import 'package:take_my_tym/core/model/app_user_model.dart';

abstract class LocalUserDataRepo{
  Future<void> storeUserDataLocal(AppUserModel user);

  Future<AppUserModel?> getUserDataFromLocal();

  Future<void> userSignOutFromLocal();
}