import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/util/app_error_msg.dart';
import 'package:take_my_tym/core/util/app_exception.dart';
import 'package:take_my_tym/features/auth/domain/usecases/verify_user_usecase.dart';

part 'verify_user_event.dart';
part 'verify_user_state.dart';

/// Manages account verification events and states.
class VerifyUserBloc extends Bloc<VerifyUserEvent, VerifyUserState> {
  VerifyUserBloc() : super(VerifyUserInitial()) {
    on<SendVerificationEmailEvent>(_sendVerificationEmail);
    on<CheckVerificationEvent>(_checkVerification);
  }

  /// Sends a verification email.
  void _sendVerificationEmail(
    SendVerificationEmailEvent event,
    Emitter<VerifyUserState> emit,
  ) async {
    // Call the VerifyUserUseCase to verify the user's email
    await GetIt.instance<VerifyUserUseCase>().verifyUserEmail();
    // Emit the VerifyUserEmailSendState, indicating the email was sent successfully
    emit(VerifyUserEmailSendState());
  }

  /// Checks if the user is verified and emits the appropriate state.
  void _checkVerification(
    CheckVerificationEvent event,
    Emitter<VerifyUserState> emit,
  ) async {
    try {
      // Calls the VerifyUserUseCase to check if the user is verified
      bool status =
          await GetIt.instance<VerifyUserUseCase>().checkUserVerified();
      // If the user is verified, emit a success state
      if (status) {
        emit(const VerifyUserSuccessState());
      } else {
        // If the user is not verified, emit an alert
        final error = AppAlert(
            alert: "The user Not Verified",
            details:
                "We send a email verifcation to user given email id. Please verify the email.");
        emit(VerifyUserNotFoundState(error: error));
      }
    } on AppException catch (e) {
      log(e.toString());
      // Creates an alert based on the exception, and emits a failed state
      final AppAlert error = AppAlert(
        alert: e.alert,
        details: e.details,
      );
      emit(
        VerifyUserFailedState(error: error),
      );
    } catch (e) {
      // If any other exception is thrown, emit a failed state with a generic alert
      emit(
        VerifyUserFailedState(error: AppAlert()),
      );
    }
  }
}
