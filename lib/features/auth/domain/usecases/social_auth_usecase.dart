import 'dart:developer';

import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/repositories/social_auth_repo.dart';

class SocialAuthUseCase{
  final SocialAuthRepo _socialAuthRepo;

  SocialAuthUseCase(this._socialAuthRepo);

  Future<AuthUserModel> googleSign()async{
     final userModel =  await _socialAuthRepo.googleSign();
    log('socail useCase: $userModel');
    return userModel;
  }
}