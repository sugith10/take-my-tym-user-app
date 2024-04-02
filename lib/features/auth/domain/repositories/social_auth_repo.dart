import 'package:take_my_tym/core/model/app_user_model.dart';

abstract class SocialAuthRepo {
  Future<AppUserModel> googleSign();
}