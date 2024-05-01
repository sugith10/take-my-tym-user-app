import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/usecases/local_user_storage_usecase.dart';

part 'app_user_event.dart';
part 'app_user_state.dart';

class AppUserBloc extends Bloc<AppEvent, AppState> {
  AppUserModel? appUserModel;
  AppUserBloc() : super(AppInitial()) {
    on<UpdateAppUserModelEvent>(
      (event, emit) async {
        appUserModel = event.appUserModel;
        await GetIt.instance<LocalUserStorageUseCase>()
            .storeUserDataLocal(event.appUserModel);
        if (appUserModel != null) {
          emit(UserModelUpdatedState());
        }
      },
    );

    on<UpdateUserSignOutEvent>((event, emit) async {
      emit(UserExitState());
    });

    on<EnsureAppUserModelExistsEvent>(
      ((event, emit) async {
        try {
          final localUserData = GetIt.instance<LocalUserStorageUseCase>();
          appUserModel = await localUserData.getUserDataFromLocal();

          if (appUserModel != null) {
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
        if (appUserModel != null) {
          final localUserData = GetIt.instance<LocalUserStorageUseCase>();
          appUserModel!.location = event.location;
          appUserModel!.longitude = event.longitude;
          appUserModel!.latitude = event.latitude;
          await localUserData.storeUserDataLocal(appUserModel!);
        }
      },
    );
  }
}
