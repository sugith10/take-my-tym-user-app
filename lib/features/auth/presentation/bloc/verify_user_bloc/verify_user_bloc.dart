import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/domain/usecases/verify_user_usecase.dart';

part 'verify_user_event.dart';
part 'verify_user_state.dart';

class VerifyUserBloc extends Bloc<VerifyUserEvent, VerifyUserState> {
  VerifyUserBloc() : super(VerifyUserInitial()) {
    final VerifyUserUseCase verifyUserUseCase =
        GetIt.instance<VerifyUserUseCase>();

    on<SendVerificationEmailEvent>(
      (event, emit) async {
        await verifyUserUseCase.verifyUserEmail();
        emit(EmailSendSuccessState());
      },
    );

    on<CheckVerificationEvent>(
      (event, emit) async {
        try {
          bool status = await verifyUserUseCase.checkUserVerified();
          if (status) {
          emit(const UserVerificationSuccessState());
          }else{
             emit( UserNotVerifiedState());
          }
        } on MyAppException catch (e) {
          log(e.toString());
          emit(
            VerificationFailedState(
              title: e.title,
              message: e.message,
            ),
          );
        } catch (e) {
          emit(
            VerificationFailedState(
              title: e.toString(),
              message: e.toString(),
            ),
          );
        }
      },
    );
  }
}
