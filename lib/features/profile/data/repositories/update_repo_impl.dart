import 'dart:io';

import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/profile/data/datasources/remote/update_profile_remote.dart';
import 'package:take_my_tym/features/profile/domain/repositories/update_profile_repo.dart';

final class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final UpdateProfileRemote _updateProfileRemoteData;

  UpdateProfileRepoImpl(this._updateProfileRemoteData);
  @override
  Future<void> updateProfileInfo({
    required AppUserModel userModel,
    required File? photo,
  }) async {
    return await _updateProfileRemoteData.updateProfile(
      appUserModel: userModel,
      profilePicture: photo,
    );
  }
}