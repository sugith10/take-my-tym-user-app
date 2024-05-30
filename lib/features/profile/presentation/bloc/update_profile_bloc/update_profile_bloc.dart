import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/model/app_user_model.dart';
import '../../../../../core/utils/app_error_msg.dart';
import '../../../../../core/utils/app_logger.dart';
import '../../../data/datasources/remote/update_profile_remote.dart';
import '../../../domain/usecases/update_profile_usecase.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class ProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  ProfileBloc() : super(UpdateProfileInitial()) {
    on<ProfileSetupEvent>(_profileSetup);

    on<ProfileUpdateEvent>((event, emit) async {
      event.userModel.about = event.about;
      event.userModel.userName = event.userName;
      event.userModel.location = event.location;
      try {
        if (event.about.isEmpty ||
            event.location.isEmpty ||
            event.userName.isEmpty) {
          emit(UpdataProfileFailState(
              alert: AppAlert(
            alert: "Profile Update Failed",
            details: "Please fill all the fields before updating your profile.",
          )));
        } else {
          emit(UpdateProfileLoadingState());
          await ProfileRemote().updateProfile(
            userModel: event.userModel,
            image: event.image,
          );
          emit(UpdateProfileSuccessState(userModel: event.userModel));
        }
      } catch (e) {
        appLogger.e(e);
      }
    });
  }

  void _profileSetup(
      ProfileSetupEvent event, Emitter<UpdateProfileState> emit) async {
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
      emit(UpdataProfileFailState(
          alert: AppAlert(
        alert: "Profile Update Failed",
        details:
            "An error occurred while updating your profile. Please try again.",
      )));
    }
  }



  
}
