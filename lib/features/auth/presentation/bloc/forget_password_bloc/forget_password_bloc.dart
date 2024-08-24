import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/util/app_error_msg.dart';
import 'package:take_my_tym/features/auth/domain/usecases/forget_password_usecase.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

/// Manages the forget password process and its states.
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>(_onForgetPassword);
  }

  /// Handles the forget password process.
  void _onForgetPassword(
    ForgetPasswordEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(ForgetPasswordLoadingState());
    try {
      // Get the ForgetPasswordUseCase from the GetIt.instance
      ForgetPasswordUseCase forgetPasswordUseCase =
          GetIt.instance<ForgetPasswordUseCase>();
      // Call the resetPassword method with the email from the event
      await forgetPasswordUseCase.resetPassword(email: event.email.trim()).then(
            // If the password is reset successfully, emit the ForgetPasswordSuccessState
            (value) => emit(
              ForgetPasswordSuccessState(),
            ),
          );
    } catch (e) {
      // If an error occurs, emit the ForgetPasswordFailState with the error message
      emit(
        ForgetPasswordFailState(error: AppAlert()),
      );
    }
  }
}
