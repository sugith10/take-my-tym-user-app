import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

abstract class SocialAuthRepo {
  Future<AuthUserModel> googleSign();
}