import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/message/domain/usecases/chat_list_usecase.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc() : super(ChatListLoadingState()) {
    ChatListUseCase chatListUseCase = GetIt.instance<ChatListUseCase>();

    on<GetChatList>(
      (event, emit) async {
        emit(ChatListLoadingState());
        try {
          Stream<DocumentSnapshot> snapshot =
              chatListUseCase.getChatList(userId: event.currentUid);
          emit(ChatListLoadedState(chatList: snapshot));
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }
}
