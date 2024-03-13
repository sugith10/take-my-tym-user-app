import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

abstract class SignUpRepo {
  Future<AuthUserModel> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
