

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/usecases/social_auth_usecases.dart';

part 'social_auth_event.dart';
part 'social_auth_state.dart';

class SocialAuthBloc extends Bloc<SocialAuthEvent, SocialAuthState> {
  SocialAuthBloc() : super(SocialAuthInitial()) {
    on<GoogleSignInEvent>((event, emit) async{
      emit((SocialAuthLoading()));
      try {
        SocialAuthUseCase socialAuthUseCase = GetIt.instance<SocialAuthUseCase>();
        AuthUserModel authUserModel = await socialAuthUseCase.googleSign();
        emit( SocialAuthSuccess(authUserModel));
      } on MyAppException catch (e) {
        log(e.toString());
        emit(
          SocialAuthError(errorMessage: e.title, errorDescription: e.message),
        );
      } catch (e) {
        log(e.toString());
        const SocialAuthError(
          errorMessage: MyAppErrorMsg.errorMessage,
          errorDescription: MyAppErrorMsg.errorDescription,
        );
      }
    });
  }
}
