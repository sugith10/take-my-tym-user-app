import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/usecases/local_user_storage_usecase.dart';

part 'app_user_event.dart';
part 'app_user_state.dart';

class AppUserBloc extends Bloc<AppEvent, AppState> {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  AppUserBloc() : super(AppInitial()) {
    on<UpdateUserModelEvent>(
      (event, emit) async {
        _userModel = event.userModel;
        await GetIt.instance<LocalUserStorageUseCase>()
            .storeUserDataLocal(event.userModel);
        if (_userModel != null) {
          emit(UserModelUpdatedState());
        }
      },
    );

    on<UpdateUserSignOutEvent>((event, emit) async {
      emit(UserExitState());
    });

    on<EnsureUserModelExistsEvent>(
      ((event, emit) async {
        try {
          final localUserData = GetIt.instance<LocalUserStorageUseCase>();
          _userModel = await localUserData.getUserDataFromLocal();

          if (_userModel != null) {
            emit(UserModelUpdatedState());
          } else {
            emit(UserModelNotFoundState());
          }
        } catch (e) {
          log("EnsureAppUserModelExistsEvent: exception ${e.toString()}");
          emit(UserModelNotFoundState());
        }
      }),
    );

    on<UpdateUserLocationEvent>(
      (event, emit) async {
        if (_userModel != null) {
          final localUserData = GetIt.instance<LocalUserStorageUseCase>();
          _userModel!.location = event.location;
          _userModel!.longitude = event.longitude;
          _userModel!.latitude = event.latitude;
          await localUserData.storeUserDataLocal(_userModel!);
        }
      },
    );
  }
}
