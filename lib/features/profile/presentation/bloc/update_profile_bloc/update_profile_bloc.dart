import 'dart:developer';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/profile/domain/usecases/update_profile_usecase.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class ProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  ProfileBloc() : super(UpdateProfileInitial()) {
    on<ProfileSetupEvent>(
      ((event, emit) async {
        log('profile setup event');
        log(event.location);
        final UpdateProfileUseCase useCase =
            GetIt.instance<UpdateProfileUseCase>();
        try {
          event.appUserModel.userName = event.userName;
          event.appUserModel.about = event.about;
          event.appUserModel.profession = event.profession;
          event.appUserModel.location = event.location;
          event.appUserModel.latitude = event.latitude;
          event.appUserModel.longitude = event.longitude;
          // log(event.appUserModel.toString());
          await useCase.updateUserProfileInfo(
            userModel: event.appUserModel,
            profilePicture: null,
          );
          emit(UpdateProfileSuccessState(appUserModel: event.appUserModel));
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
        // await UpdateProfileRemoteData()
        //     .updateProfile(
        //   appUserModel: event.userModel,
        //   image: event.image,
        // )
        //     .then((value) {
        //   log('success from bloc');
        // });
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
