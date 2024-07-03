import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'online_bloc_event.dart';
part 'online_bloc_state.dart';

class OnlineBlocBloc extends Bloc<OnlineBlocEvent, OnlineBlocState> {
  OnlineBlocBloc() : super(OnlineBlocInitial()) {
    on<OnlineBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
