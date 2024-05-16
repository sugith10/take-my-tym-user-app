import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/auth/domain/usecases/local_user_storage_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signin_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LogInEvent>(_onSignIn);
  }

  /// Manages user sign-in, including loading state indication and error handling.
  _onSignIn(
    LogInEvent event,
    Emitter<SignInState> emit,
  ) async {
    // The SignInLoadingState is emitted to indicate that the sign in process is loading
    emit(SignInLoadingState());
    // try is used to handle exceptions
    try {
      // SignInUseCase is retrieved from the GetIt instance
      SignInUseCase signInUseCase = GetIt.instance<SignInUseCase>();

      // authUserModel is set to the result of the authenticateUser method, which takes the email and password as arguments
      UserModel authUserModel =
          await signInUseCase.authenticateUser(event.email, event.password);

      // storeUserDataLocal is called with the authUserModel as an argument, which stores the user data locally
      await GetIt.instance<LocalUserStorageUseCase>()
          .storeUserDataLocal(authUserModel);
      // if the authUserModel is blocked, a SignInErrorState with an AppAlert is emitted
      if (authUserModel.blocked) {
        emit(SignInErrorState(
            error: AppAlert(
                alert:
                    "Due to unusual activity, your account has been blocked.")));
        // else, if the authUserModel has a about, a SignInSuccessState with a profileSetupComp set to true is emitted
      } else {
        if (authUserModel.about != null) {
          emit(SignInSuccessState(
            profileSetupComp: true,
            userModel: authUserModel,
          ));
        } else {
          // else, a SignInSuccessState with a profileSetupComp set to false is emitted
          emit(SignInSuccessState(
            profileSetupComp: false,
            userModel: authUserModel,
          ));
        }
      }
    } on AppException catch (e) {
      // An AppAlert is created with the alert and details from the exception
      final AppAlert error = AppAlert(
        alert: e.alert,
        details: e.details,
      );
      // a SignInErrorState with the AppAlert is emitted
      emit(
        SignInErrorState(error: error),
      );
    } catch (e) {
      // log the error
      appLogger.e(e);

      // a SignInErrorState with AppAlert is emitted
      emit(
        SignInErrorState(error: AppAlert()),
      );
    }
  }
}
