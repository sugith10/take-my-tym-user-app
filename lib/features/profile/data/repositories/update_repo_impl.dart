import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/profile/data/datasources/remote/update_profile_remote.dart';
import 'package:take_my_tym/features/profile/domain/repositories/update_profile_repo.dart';

final class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final UpdateProfileRemote _updateProfileRemoteData;

  UpdateProfileRepoImpl(this._updateProfileRemoteData);
  @override
  Future<void> updateProfileInfo({
    required UserModel userModel,
    required XFile? image,
  }) async {
    return await _updateProfileRemoteData.updateProfile(
      UserModel: userModel,
      image: image,
    );
  }
}