import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/repositories/local_user_storage_repo.dart';

final class LocalUserStorageUseCase {
  final LocalUserDataRepo _localUserDataRepo;

  LocalUserStorageUseCase(this._localUserDataRepo);

  Future<void> storeUserDataLocal(UserModel user) async {
    return await _localUserDataRepo.storeUserDataLocal(user);
  }

  Future<UserModel?> getUserDataFromLocal() async {
    return await _localUserDataRepo.getUserDataFromLocal();
  }

  Future<void> userSignOutFromLocal() async {
    return await _localUserDataRepo.userSignOutFromLocal();
  }
}
