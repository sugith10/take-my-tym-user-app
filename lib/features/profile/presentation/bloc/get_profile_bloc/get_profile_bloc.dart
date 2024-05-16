import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/features/profile/domain/usecases/update_profile_usecase.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  GetProfileBloc() : super(GetProfileLoading()) {
    on<GetProfileEvent>(getProfile);
  }

  getProfile(GetProfileEvent event, Emitter<GetProfileState> emit) async {
    emit(GetProfileLoading());
    try{
     final profile = await GetIt.instance<ProfileUseCase>().getProfile(userId: event.userId);
     emit(GetProfileLoaded(userModel: profile));
    }catch(e){
      emit(GetProfileFail(errorMsg: AppAlert ()));
    }
  }
}
