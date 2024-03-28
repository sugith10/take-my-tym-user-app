import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_out_bloc_event.dart';
part 'sign_out_bloc_state.dart';

class SignOutBlocBloc extends Bloc<SignOutBlocEvent, SignOutBlocState> {
  SignOutBlocBloc() : super(SignOutBlocInitial()) {
    on<SignOutBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
