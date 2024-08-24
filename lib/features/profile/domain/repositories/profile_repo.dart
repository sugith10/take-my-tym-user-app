import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';

abstract interface class UpdateProfileRepo {
  Future<void> updateProfileInfo(
      {required UserModel userModel, required XFile? image});

  Future<UserModel> getProfile({required String userId});
}
