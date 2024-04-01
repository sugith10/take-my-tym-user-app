import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/auth/domain/usecases/forget_password_usecase.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      emit(ForgetPasswordLoadingState());
      try {
        ForgetPasswordUseCase forgetPasswordUseCase =
            GetIt.instance<ForgetPasswordUseCase>();
        await forgetPasswordUseCase
            .resetPassword(email: event.email.trim())
            .then(
              (value) => emit(
                ForgetPasswordSuccessState(),
              ),
            );
      } catch (e) {
        emit(
          ForgetPasswordFailState(
            message: e.toString(),
            description: e.toString(),
          ),
        );
      }
    });
  }
}
