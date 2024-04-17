import 'dart:io';

import 'package:take_my_tym/core/model/app_user_model.dart';

abstract class UpdateProfileRepo {
  Future<void> updateProfileInfo({
    required AppUserModel userModel,
    required File? photo,
  });
}
