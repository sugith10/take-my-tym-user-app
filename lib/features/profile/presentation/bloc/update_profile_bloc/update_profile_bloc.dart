import 'dart:developer';
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
          event.userModel.userName = event.userName;
          event.userModel.about = event.about;
          event.userModel.profession = event.profession;
          event.userModel.location = event.location;
          event.userModel.latitude = event.latitude;
          event.userModel.longitude = event.longitude;
          // log(event.UserModel.toString());
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
        // await UpdateProfileRemoteData()
        //     .updateProfile(
        //   UserModel: event.userModel,
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
