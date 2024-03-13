import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/domain/usecases/signin_usecases.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<AuthSignInEvent>((event, emit) async {
      emit(LoadingState());
      try{
        SignInUseCase signInUseCase = 
          GetIt.instance<SignInUseCase>();
        
        AuthUserModel authUserModel = await signInUseCase
        .authenticateUser(event.email, event.password);

        emit(SignInSuccessState(authUserModel));
      }catch(e){
        log(e.toString());
        emit(ErrorState(e.toString()));
      }
    });
  }
}
