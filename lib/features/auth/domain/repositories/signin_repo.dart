import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

abstract class SignInRepo {
  Future<AuthUserModel> authenticateUser(
    String email,
    String password,
  );
}
