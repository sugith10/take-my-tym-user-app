import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/model/app_user_model.dart';
import '../../../data/datasources/remote/update_profile_remote.dart';
import '../../../domain/usecases/update_profile_usecase.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class ProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  ProfileBloc() : super(UpdateProfileInitial()) {
    on<ProfileSetupEvent>(
      ((event, emit) async {
        final ProfileUseCase useCase = GetIt.instance<ProfileUseCase>();
        try {
          event.userModel.userName = event.userName;
          event.userModel.about = event.about;
          event.userModel.profession = event.profession;
          event.userModel.location = event.location;
          event.userModel.latitude = event.latitude;
          event.userModel.longitude = event.longitude;
          await useCase.updateUserProfileInfo(
            userModel: event.userModel,
            profilePicture: null,
          );
          emit(UpdateProfileSuccessState(userModel: event.userModel));
        } catch (e) {
          log(e.toString());
          emit(UpdataProfileFailState());
        }
      }),
    );

    on<CollectUpdateDataEvent>((event, emit) async {
      event.userModel.about = event.about;
      event.userModel.userName = event.userName;
      event.userModel.location = event.location;
      try {
        if (event.about.isEmpty ||
            event.location.isEmpty ||
            event.userName.isEmpty) {
          emit(UpdataProfileFailState());
        } else {
          emit(UpdateProfileLoadingState());
          await ProfileRemote().updateProfile(
            userModel: event.userModel,
            image: event.image,
          );
          emit(UpdateProfileSuccessState(userModel: event.userModel));
        }
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
