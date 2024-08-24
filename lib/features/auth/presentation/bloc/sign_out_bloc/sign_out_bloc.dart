import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/util/app_error_msg.dart';
import '../../../../../core/util/app_exception.dart';
import '../../../domain/usecases/local_user_storage_usecase.dart';
import '../../../domain/usecases/signout_usecase.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

/// Manages user sign-out process and its states.
class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  SignOutBloc() : super(SignOutInitial()) {
    on<UserSignOutEvent>(_onSignOut);
  }

  /// Handles user sign-out process
  void _onSignOut(UserSignOutEvent event, Emitter<SignOutState> emit) async {
    emit(SignOutLoadingState());
    try {
      // Get the SignOutUseCase from the GetIt library
      final SignOutUseCase signOutUseCase = GetIt.instance<SignOutUseCase>();
      // Call the signOutUser() method on the SignOutUseCase
      await signOutUseCase.signOutUser().then((value) async {
        // Call the userSignOutFromLocal() method on the LocalUserStorageUseCase
        await GetIt.instance<LocalUserStorageUseCase>().userSignOutFromLocal();
        // Emit the SignOutSuccessState to indicate that the sign-out process was successful
        emit(SignOutSuccessState());
      });
    } on AppException catch (e) {
      // Create an AppAlert from the AppException
      final AppAlert error = AppAlert(
        alert: e.alert,
        details: e.details,
      );
      // Emit the SignOutFailState with the AppAlert
      emit(
        SignOutFailState(error: error),
      );
    } catch (e) {
      // Emit the SignOutFailState with an empty AppAlert
      emit(
        SignOutFailState(
          error: AppAlert(),
        ),
      );
    }
  }
}
