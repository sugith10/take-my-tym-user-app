import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signup_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateUserEvent>(_onSingUp);
  }

  /// Manages the user sign-up process, including handling loading, success, and error states.
  /// Creates a new user with provided details and emits the corresponding states.
  void _onSingUp(CreateUserEvent event, Emitter<SignUpState> emit) async {
    // Emit a SignUpLoadingState indicating that the sign up process is beginning
    emit(SignUpLoadingState());
    try {
      // Get the SignUpUseCase
      SignUpUseCase signUpUseCase = GetIt.instance<SignUpUseCase>();

      // Call the createUser method with the given event parameters
      await signUpUseCase
          .createUser(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
      )
          .then(
        // If the user is created successfully, emit a SignUpSuccessState
        (value) {
          emit(SignUpSuccessState(value));
        },
      );
    } on AppException catch (e) {
      // Log the error
      appLogger.e(e);
      // Emit a SignUpFailState with the error
      emit(SignUpFailState(error: AppAlert()));
    }
  }
}
