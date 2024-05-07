import 'package:take_my_tym/core/model/app_user_model.dart';

abstract interface class SignInRepo {
  Future<UserModel> authenticateUser(
    String email,
    String password,
  );
}
