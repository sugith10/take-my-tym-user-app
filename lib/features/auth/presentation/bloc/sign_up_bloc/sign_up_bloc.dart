import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signup_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

/// Manages user email sign-up process and its states.
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateUserEvent>(_onSingUp);
  }

  /// Handles user email sign-up process and its states.
  void _onSingUp(CreateUserEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoadingState());
    // Check if the form is valid
    if (event.formKey.currentState!.validate()) {
      try {
        // Get the SignUpUseCase
        final signUpUseCase = GetIt.instance<SignUpUseCase>();

        // Call the createUser method with the given event parameters
        final user = await signUpUseCase.createUser(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
        );
        emit(SignUpSuccessState(user));
      } on AppException catch (e) {
        appLogger.e(e);
        // Emit a SignUpFailState with the error
        emit(SignUpFailState(error: AppAlert()));
      }
    } else {
      emit(SignUpFailState(error: AppAlert()));
    }
  }
}
