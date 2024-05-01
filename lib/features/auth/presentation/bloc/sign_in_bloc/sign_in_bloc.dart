import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/usecases/local_user_storage_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signin_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LogInEvent>((event, emit) async {
      emit(SignInLoadingState());
      try {
        SignInUseCase signInUseCase = GetIt.instance<SignInUseCase>();

        AppUserModel authUserModel =
            await signInUseCase.authenticateUser(event.email, event.password);

        await GetIt.instance<LocalUserStorageUseCase>()
            .storeUserDataLocal(authUserModel);
        if (authUserModel.about != null) {
          emit(SignInSuccessState(
            profileSetupComp: true,
            userModel: authUserModel,
          ));
        } else {
          emit(SignInSuccessState(
            profileSetupComp: false,
            userModel: authUserModel,
          ));
        }
      } on AppException catch (e) {
        final AppErrorMsg error = AppErrorMsg(
          title: e.alert,
          content: e.details,
        );
        emit(
          SignInErrorState(error: error),
        );
      } catch (e) {
        log(e.toString());

        emit(
          SignInErrorState(error: AppErrorMsg()),
        );
      }
    });
  }
}
