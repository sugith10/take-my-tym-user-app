import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial()) {
    on<CreatePostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
