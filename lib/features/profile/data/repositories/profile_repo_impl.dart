import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/profile/data/datasources/remote/update_profile_remote.dart';
import 'package:take_my_tym/features/profile/domain/repositories/profile_repo.dart';

final class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final ProfileRemote _profileRemoteData;

  UpdateProfileRepoImpl(this._profileRemoteData);
  @override
  Future<void> updateProfileInfo({
    required UserModel userModel,
    required XFile? image,
  }) async {
    return await _profileRemoteData.updateProfile(
      userModel: userModel,
      image: image,
    );
  }

  @override
  Future<UserModel> getProfile({required String userId}) async {
    return await _profileRemoteData.getProfile(userId: userId);
  }
}