import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/auth/domain/usecases/local_user_storage_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  UserBloc() : super(UserInitial()) {
    on<UserUpdateEvent>(_updateUserModel);
    on<UserExitEvent>(_userSignOut);
    on<UserCheckEvent>((_ensureUser));
    on<UserLocationUpdateEvent>(_updateUserLocation);
  }

  _updateUserModel(
    UserUpdateEvent event,
    Emitter<UserState> emit,
  ) async {
    _userModel = event.userModel;
    await GetIt.instance<LocalUserStorageUseCase>()
        .storeUserDataLocal(event.userModel);
    if (_userModel != null) {
      emit(UserUpdatedState());
    }
  }

  _ensureUser(UserCheckEvent event, Emitter<UserState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final localUserData = GetIt.instance<LocalUserStorageUseCase>();
      _userModel = await localUserData.getUserDataFromLocal();

      if (_userModel != null) {
        emit(UserUpdatedState());
      } else {
        emit(UserNotFoundState());
      }
    } catch (e) {
      emit(UserNotFoundState());
    }
  }

  _updateUserLocation(
      UserLocationUpdateEvent event, Emitter<UserState> emit) async {
    if (_userModel != null) {
      final localUserData = GetIt.instance<LocalUserStorageUseCase>();
      _userModel!.location = event.location;
      _userModel!.longitude = event.longitude;
      _userModel!.latitude = event.latitude;
      await localUserData.storeUserDataLocal(_userModel!);
    }
  }

  _userSignOut(UserExitEvent event, Emitter<UserState> emit) async {
    emit(UserExitState());
  }
}
