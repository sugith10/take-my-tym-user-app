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
    on<UserSignOutEvent>(_onSignOut);
  }

  /// Manages the password reset process, displaying loading state and emitting success or failure states.
  /// This includes invoking the reset password use case and handling the corresponding outcomes.
  void _onSignOut(UserSignOutEvent event, Emitter<SignOutState> emit) async {
    // Emit the UserSignOutLoadingState to indicate that the sign-out process has started
    emit(UserSignOutLoadingState());
    try {
      // Get the SignOutUseCase from the GetIt library
      final SignOutUseCase signOutUseCase = GetIt.instance<SignOutUseCase>();
      // Call the signOutUser() method on the SignOutUseCase
      await signOutUseCase.signOutUser().then((value) async {
        // Call the userSignOutFromLocal() method on the LocalUserStorageUseCase
        await GetIt.instance<LocalUserStorageUseCase>().userSignOutFromLocal();
        // Emit the UserSignOutSuccessState to indicate that the sign-out process was successful
        emit(UserSignOutSuccessState());
      });
    } on AppException catch (e) {
      // Create an AppAlert from the AppException
      final AppAlert error = AppAlert(
        alert: e.alert,
        details: e.details,
      );
      // Emit the UserSignOutFailState with the AppAlert
      emit(
        UserSignOutFailState(error: error),
      );
    } catch (e) {
      // Emit the UserSignOutFailState with an empty AppAlert
      emit(
        UserSignOutFailState(
          error: AppAlert(),
        ),
      );
    }
  }
}
