import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/features/message/domain/usecases/individual_message_usecase.dart';

part 'individual_message_event.dart';
part 'individual_message_state.dart';

class IndividualMessageBloc
    extends Bloc<IndividualMessageEvent, IndividualMessageState> {
  IndividualMessageBloc() : super(IndividualMessageInitial()) {
    IndividualMessageUseCase individualMessageUseCase =
        GetIt.instance<IndividualMessageUseCase>();

    on<SendMessageEvent>(
      (event, emit) {
        try {
          String message = event.message.trim();
          if (message.isNotEmpty) {
            log("not empty");
            individualMessageUseCase.sendMessage(
              currentUid: event.currentUid,
              receiverUid: event.receiverUid,
              message: message,
            );
          }
        } catch (e) {
          log(e.toString());
        }
      },
    );

    on<GetMessagesEvent>((event, emit) {
      try {
        log("on getMessses =-");
        Stream<QuerySnapshot> chatSnapshot =
            individualMessageUseCase.getMessages(
          currentUid: event.currentUserId,
          receiverUid: event.recipientUserId,
        );
        log(chatSnapshot.toString());
        Stream<DocumentSnapshot> recipientUserInfoSnapshot =
            individualMessageUseCase.getChatPartnerInfoStream(
                recipientUserId: event.recipientUserId);
        emit(
          IndividualChatsLoadedState(
            messages: chatSnapshot,
            userInfo: recipientUserInfoSnapshot,
          ),
        );
        log(chatSnapshot.toString());
      } catch (e) {}
    });
  }
}
