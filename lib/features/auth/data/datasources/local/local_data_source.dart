import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';

// Function to store user data in Hive after signing in
Future<void> storeUserDataInHive(AppUserModel user) async {
  final userBox = await Hive.openBox('userData');

  await userBox.put('user', user.toJson());
  userBox.close();
}

// Function to retrieve user data from Hive
Future<AppUserModel?> getUserDataFromHive() async {
  try {
    final userBox = await Hive.openBox('userData');

    final userData = userBox.get('user');
    print('User Data Type: ${userData.runtimeType}');
    if (userData != null) {
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
Future<void> userSignOut() async {
  try {
    final userBox = await Hive.openBox('userData');
    await userBox.put('user', null);
    userBox.close();
  } catch (e) {
    throw MyAppException(message: e.toString(), title: e.toString());
  }
}
