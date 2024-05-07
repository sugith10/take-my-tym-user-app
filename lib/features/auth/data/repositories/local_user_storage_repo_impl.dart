import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/data/datasources/local/local_data_source.dart';
import 'package:take_my_tym/features/auth/domain/repositories/local_user_storage_repo.dart';

final class LocalUserDataRepoImpl implements LocalUserDataRepo{
  
  final LocalUserData _localUserData;
  
  LocalUserDataRepoImpl(this._localUserData);
  
  @override
  Future<UserModel?> getUserDataFromLocal() async{
    
   return await _localUserData.getUserDataFromLocal();
  }

  @override
  Future<void> storeUserDataLocal(UserModel user) async{
    return await _localUserData.storeUserDataLocal(user);
  }

  @override
  Future<void> userSignOutFromLocal() async{
   return await _localUserData.userSignOutFromLocal();
  }
  
}