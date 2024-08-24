import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/repositories/social_auth_repo.dart';

class SocialAuthUseCase{
  final SocialAuthRepo _socialAuthRepo;

  SocialAuthUseCase(this._socialAuthRepo);

  Future<UserModel> googleSign()async{
    return _socialAuthRepo.googleSign();
  }
}