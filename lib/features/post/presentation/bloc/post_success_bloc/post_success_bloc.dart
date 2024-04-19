import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_success_event.dart';
part 'post_success_state.dart';

class PostSuccessBloc extends Bloc<PostSuccessEvent, PostSuccessState> {
  PostSuccessBloc() : super(PostSuccessInitial()) {
    int time = 8;
    on<PostSuccessEvent>((event, emit) {
     emit(PostSuccessCountDownState(time: time));
    });
  }
}
