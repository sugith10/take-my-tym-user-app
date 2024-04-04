import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_post_event.dart';
part 'update_post_state.dart';

class UpdatePostBloc extends Bloc<UpdatePostEvent, UpdatePostState> {
  UpdatePostBloc() : super(UpdatePostInitial()) {
    on<UpdatePostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
