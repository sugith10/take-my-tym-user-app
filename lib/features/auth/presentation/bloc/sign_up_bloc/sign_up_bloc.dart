import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signup_usecases.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateUser>((event, emit) async {
      emit(LoadingState());
      try {
        SignUpUseCase signUpUseCase = GetIt.instance<SignUpUseCase>();

        AuthUserModel authUserModel = await signUpUseCase.createUser(
            email: event.email,
            password: event.password,
            firstName: event.firstName,
            lastName: event.lastName);
        emit(SignUpSuccessState(authUserModel));
      } on MyAppException catch (e) {
        log(e.toString());
        emit(SignUpErrorState(
          title: e.title,
          message: e.message,
        ));
      }
    });
  }
}
