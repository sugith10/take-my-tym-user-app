import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/data/datasources/local/local_data_source.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppUserModel? appUserModel;
  AppBloc() : super(AppInitial()) {
    on<UpdateAppUserModelEvent>(
      (event, emit) {
        appUserModel = event.appUserModel;
        log("updataed AppBloc $appUserModel");
        if (appUserModel != null) {
          emit(UserModelUpdatedState());
        }
      },
    );

    on<UpdateUserSignOutEvent>((event, emit) => emit(UserExitState()));

    on<EnsureAppUserModelExistsEvent>(
      ((event, emit) async {
        try {
          appUserModel = await getUserDataFromHive();
          if (appUserModel != null) {
            emit(UserModelUpdatedState());
          } else {
            emit(UserModelNotFoundState());
          }
        } catch (e) {
          log(e.toString());
          emit(UserModelNotFoundState());
        }
      }),
    );
  }
}
