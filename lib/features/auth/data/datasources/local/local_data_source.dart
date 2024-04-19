import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

final class LocalUserData{
  // Function to store user data in Hive after signing in
Future<void> storeUserDataLocal(AppUserModel user) async {
  final userBox = await Hive.openBox('userData');
  log('on update userData');
  await userBox.put('user', user.toMap());
  userBox.close();
}

// Function to retrieve user data from Hive
Future<AppUserModel?> getUserDataFromLocal() async {
  try {
    final userBox = await Hive.openBox('userData');

    final userData = userBox.get('user');
    print('User Data Type: ${userData.runtimeType}');
    if (userData != null ) {
      log("look at the data $userData");
      final userDataMap = Map<String, dynamic>.from(userData);
      log("getUserDataFromHive: $userDataMap");
      userBox.close();
      return AppUserModel.fromMap(userDataMap);
    }
  } catch (e) {
    log(e.toString());
    throw MyAppException(message: e.toString(), title: e.toString());
  }
  return null;
}

// Function to logout user
Future<void> userSignOutFromLocal() async {
  try {
    final userBox = await Hive.openBox('userData');
    await userBox.clear();
    userBox.close();
  } catch (e) {
    throw MyAppException(message: e.toString(), title: e.toString());
  }
}

}

