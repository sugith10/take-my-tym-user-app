import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppUserModel? appUserModel;
  AppBloc() : super(AppInitial()) {
    on<UpdateAppUserModelEvent>((event, emit) {
      appUserModel = event.appUserModel;
      log("updataed AppBloc $appUserModel");
      if (appUserModel != null) {
        emit(UserModelUpdatedState(appUserModel: appUserModel!));
      }
    });

    on<UpdateUserSignOutEvent>((event, state) {
      appUserModel = null;
    });
  }
}
