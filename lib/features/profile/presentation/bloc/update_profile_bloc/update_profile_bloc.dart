import 'dart:developer';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/features/profile/data/datasources/remote/update_profile.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(UpdateProfileInitial()) {
    on<ProfileSetupEvent>(
      ((event, emit) {
        
      }),
    );

    on<CollectUpdateDataEvent>((event, emit) async {
      event.userModel.about = event.about;
      event.userModel.userName = event.userName;
      event.userModel.location = event.location;
      try {
        await UpdateProfileRemoteData()
            .updateProfile(
          appUserModel: event.userModel,
          image: event.image,
        )
            .then((value) {
          log('success from bloc');
        });
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
