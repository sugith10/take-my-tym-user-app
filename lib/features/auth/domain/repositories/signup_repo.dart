import 'package:take_my_tym/core/model/app_user_model.dart';

abstract  interface class SignUpRepo {
  Future<UserModel> createUser({
    required String firstName,

    required String email,
    required String password,
  });
}
