import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/features/location/presentation/bloc/location_bloc.dart';

import '../../../../../core/model/app_user_model.dart';
import '../../../../../core/util/app_error_msg.dart';
import '../../../../../core/util/app_logger.dart';
import '../../../data/datasources/remote/update_profile_remote.dart';
import '../../../domain/usecases/update_profile_usecase.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class ProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  ProfileBloc() : super(UpdateProfileInitial()) {
    on<ProfileSetupEvent>(_profileSetup);

    on<ProfileUpdateEvent>(_updateProfile);
  }

  void _updateProfile(
    ProfileUpdateEvent event,
    Emitter<UpdateProfileState> emit,
  ) async {
    event.userModel.about = event.about;
    event.userModel.userName = event.userName;
    event.userModel.location = event.location;
    try {
      if (event.about.isEmpty ||
          event.location.isEmpty ||
          event.userName.isEmpty) {
        emit(
          UpdataProfileFailState(
            alert: AppAlert(
              alert: "Profile Update Failed",
              details: "Please fill in all the fields.",
            ),
          ),
        );
        emit(UpdatingProfileState());
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
  }

  void _profileSetup(
      ProfileSetupEvent event, Emitter<UpdateProfileState> emit) async {
    final ProfileUseCase useCase = GetIt.instance<ProfileUseCase>();
    final locationState = event.locationBloc.state;
    if (locationState is LocationResultState) {
      event.userModel.location = locationState.placeName;
      event.userModel.latitude = locationState.latitude;
      event.userModel.longitude = locationState.longitude;
    } else {
      emit(
        UpdataProfileFailState(
          alert: AppAlert(
            alert: "Profile update failed",
            details: "Please fill in all the fields.",
          ),
        ),
      );
      emit(UpdatingProfileState());
      return;
    }

    if (event.userName.isEmpty ||
        event.about.isEmpty ||
        event.profession.isEmpty) {
      emit(
        UpdataProfileFailState(
          alert: AppAlert(
            alert: "Profile update failed",
            details: "Please fill in all the fields.",
          ),
        ),
      );
      emit(UpdatingProfileState());
      return;
    } else {
      event.userModel.userName = event.userName;
      event.userModel.about = event.about;
      event.userModel.profession = event.profession;
      try {
        log("${event.userModel}");
        await useCase.updateUserProfileInfo(
          userModel: event.userModel,
          profilePicture: null,
        );
        emit(UpdateProfileSuccessState(userModel: event.userModel));
      } catch (e) {
        emit(
          UpdataProfileFailState(
            alert: AppAlert(
              alert: "Profile update failed",
              details:
                  "An error occurred while updating your profile. Please try again.",
            ),
          ),
        );
        emit(UpdatingProfileState());
        return;
      }
    }
  }
}
