import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<AuthSignInEvent>((event, emit) async {
      emit(LoadingState());
      try{
        
      }catch(e){
        log(e.toString());
        emit(ErrorState(e.toString()));
      }
    });
  }
}
