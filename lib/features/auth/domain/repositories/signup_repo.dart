import 'package:take_my_tym/core/model/app_user_model.dart';

abstract class SignUpRepo {
  Future<AppUserModel> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
