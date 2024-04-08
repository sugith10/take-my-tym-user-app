import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
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
          individualMessageUseCase.sendMessage(
            currentUid: event.currentUid,
            receiverUid: event.receiverUid,
            message: event.message,
          );
        } catch (e) {
          log(e.toString());
        }
      },
    );

    on<GetMessagesEvent>((event, emit) {
      try {
        Stream<QuerySnapshot> snapshot = individualMessageUseCase.getMessages(
          currentUid: event.currentUid,
          receiverUid: event.receiverUid,
        );

        emit(GetMessagesLoaded(messages: snapshot));
      } catch (e) {}
    });
  }
}
