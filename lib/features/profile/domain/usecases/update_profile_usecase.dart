import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/profile/domain/repositories/update_profile_repo.dart';

final class UpdateProfileUseCase {
  final UpdateProfileRepo _updateProfileRepo;

  UpdateProfileUseCase(this._updateProfileRepo);

  updateUserProfileInfo({
    required AppUserModel userModel,
    required XFile? profilePicture,
  }) async {
    return await _updateProfileRepo.updateProfileInfo(
      userModel: userModel,
      image: profilePicture,
    );
  }
}
