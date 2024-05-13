
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/profile/domain/repositories/profile_repo.dart';

final class ProfileUseCase {
  final UpdateProfileRepo _updateProfileRepo;

  ProfileUseCase(this._updateProfileRepo);

 Future<void> updateUserProfileInfo({
    required UserModel userModel,
    required XFile? profilePicture,
  }) async {
    return await _updateProfileRepo.updateProfileInfo(
      userModel: userModel,
      image: profilePicture,
    );
  }

  Future<UserModel> getProfile({required String userId})async{
    return await _updateProfileRepo.getProfile(userId: userId);
  }
}
