import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signout_usecase.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  SignOutBloc() : super(SignOutInitial()) {
    on<UserSignOutEvent>((event, emit) async {
      emit(UserSignOutLoadingState());
      try {
        final SignOutUseCase signOutUseCase = GetIt.instance<SignOutUseCase>();
        await signOutUseCase.signOutUser();
        emit(UserSignOutSuccessState());
      } on MyAppException catch (e) {
        emit(
          UserSignOutFailState(
            title: e.title,
            message: e.message,
          ),
        );
      } catch (e) {
        emit(
          const UserSignOutFailState(
            title: MyAppErrorMsg.errorMessage,
            message: MyAppErrorMsg.errorDescription,
          ),
        );
      }
    });
  }
}
