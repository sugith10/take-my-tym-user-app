import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

class AppUserModel {
 AuthUserModel userModel = const AuthUserModel();

 void updateUserModel({required AuthUserModel authUserModel}){
  userModel = authUserModel;
 }
}