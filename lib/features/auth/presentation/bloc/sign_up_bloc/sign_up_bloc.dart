import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signup_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateUserEvent>((event, emit) async {
      emit(SignUpLoadingState());
      try {
        SignUpUseCase signUpUseCase = GetIt.instance<SignUpUseCase>();

        await signUpUseCase
            .createUser(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
        )
            .then(
          (value) {
            emit(SignUpSuccessState(value));
          },
        );
      } on MyAppException catch (e) {
        log(e.toString());
        emit(SignUpFailState(
          title: e.title,
          message: e.message,
        ));
      }
    });
  }
}
