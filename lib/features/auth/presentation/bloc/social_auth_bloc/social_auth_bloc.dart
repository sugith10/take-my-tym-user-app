import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/usecases/local_user_storage_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/social_auth_usecase.dart';

part 'social_auth_event.dart';
part 'social_auth_state.dart';

class SocialAuthBloc extends Bloc<SocialAuthEvent, SocialAuthState> {
  SocialAuthBloc() : super(SocialAuthInitial()) {
    on<GoogleSignEvent>((event, emit) async {
      emit((SocialAuthLoadingState()));
      try {
        SocialAuthUseCase socialAuthUseCase =
            GetIt.instance<SocialAuthUseCase>();
        await socialAuthUseCase.googleSign().then(
          (value) async {
            await GetIt.instance<LocalUserStorageUseCase>()
                .storeUserDataLocal(value);
            emit(SocialAuthSuccessState(value));
          },
        );
      } on MyAppException catch (e) {
        log(e.toString());
        emit(
          SocialAuthFailState(
              errorMessage: e.title, errorDescription: e.message),
        );
      } catch (e) {
        log(e.toString());
        const SocialAuthFailState(
          errorMessage: MyAppErrorMsg.errorMessage,
          errorDescription: MyAppErrorMsg.errorDescription,
        );
      }
    });
  }
}
