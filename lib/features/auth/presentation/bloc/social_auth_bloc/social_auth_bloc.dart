import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/model/app_user_model.dart';
import '../../../../../core/util/app_error_msg.dart';
import '../../../../../core/util/app_exception.dart';
import '../../../../../core/util/app_logger.dart';
import '../../../domain/usecases/local_user_storage_usecase.dart';
import '../../../domain/usecases/social_auth_usecase.dart';

part 'social_auth_event.dart';
part 'social_auth_state.dart';

/// Manages social authentication like Google auth and its events and states.
class SocialAuthBloc extends Bloc<SocialAuthEvent, SocialAuthState> {
  SocialAuthBloc() : super(SocialAuthInitial()) {
    on<GoogleSignEvent>(_onGoogleSign);
  }

  /// Handles Google sign-in process.
  void _onGoogleSign(
    GoogleSignEvent event,
    Emitter<SocialAuthState> emit,
  ) async {
    // Emits a loading state to indicate that the authentication process has started.
    emit((SocialAuthLoadingState()));
    try {
      // Retrieves an instance of `SocialAuthUseCase` from the GetIt library.
      SocialAuthUseCase socialAuthUseCase = GetIt.instance<SocialAuthUseCase>();
      // Executes the `googleSign()` method on the `socialAuthUseCase` and passes the result to the async function.
      await socialAuthUseCase.googleSign().then(
        // The condition `userModel == null` occurs when the user has not set up their profile yet,
        // indicating that the user is a new user who hasn't completed the profile setup process.
        (value) async {
          if (value.blocked) {
            // Emits a fail state with an alert indicating that the user's account has been blocked.
            emit(SocialAuthFailState(
              error: AppAlert(
                  alert: "Your account has been blocked.",
                  details:
                      "Please contact the service center for more details."),
            ));
          } else {
            if (value.about != null) {
              // Stores the user data locally if the `about` field is not null.
              await GetIt.instance<LocalUserStorageUseCase>()
                  .storeUserDataLocal(value);
              // Emits a success state with the user model and a boolean indicating whether the profile setup is complete.
              emit(SocialAuthSuccessState(
                  userModel: value, profileSetupComp: true));
            } else {
              // Emits a success state with the user model and a boolean indicating whether the profile setup is complete.
              emit(SocialAuthSuccessState(
                  userModel: value, profileSetupComp: false));
            }
          }
        },
      );
    } on AppException catch (e) {
      // Logs the exception and emits an error state with an alert and details.
      appLogger.e(e);
      final AppAlert appError = AppAlert(
        alert: e.alert,
        details: e.details,
      );
      emit(
        SocialAuthFailState(
          error: appError,
        ),
      );
    }
  }
}
