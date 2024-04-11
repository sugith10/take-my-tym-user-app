import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_tile_event.dart';
part 'chat_tile_state.dart';

class ChatTileBloc extends Bloc<ChatTileEvent, ChatTileState> {
  ChatTileBloc() : super(ChatTileInitial()) {
    on<ChatTileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
