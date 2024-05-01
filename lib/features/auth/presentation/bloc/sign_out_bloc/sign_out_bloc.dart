import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/auth/domain/usecases/local_user_storage_usecase.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signout_usecase.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  SignOutBloc() : super(SignOutInitial()) {
    on<UserSignOutEvent>((event, emit) async {
      emit(UserSignOutLoadingState());
      try {
        final SignOutUseCase signOutUseCase = GetIt.instance<SignOutUseCase>();
        await signOutUseCase.signOutUser().then((value) async {
          await GetIt.instance<LocalUserStorageUseCase>()
              .userSignOutFromLocal();
          emit(UserSignOutSuccessState());
        });
      } on AppException catch (e) {
        final AppErrorMsg error = AppErrorMsg(
          title: e.alert,
          content: e.details,
        );
        emit(
          UserSignOutFailState(error: error),
        );
      } catch (e) {
      
        emit(
          UserSignOutFailState(
            error: AppErrorMsg(),
          ),
        );
      }
    });
  }
}
