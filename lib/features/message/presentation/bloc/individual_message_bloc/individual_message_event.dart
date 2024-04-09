part of 'individual_message_bloc.dart';

sealed class IndividualMessageEvent {
  const IndividualMessageEvent();
}

final class SendMessageEvent extends IndividualMessageEvent {
  final String currentUid;
  final String receiverUid;
  final String message;
  final String senderName;
  final String receiverName;

  SendMessageEvent({
    required this.message,
    required this.currentUid,
    required this.receiverUid,
    required this.senderName,
    required this.receiverName,
  });
}

final class GetMessagesEvent extends IndividualMessageEvent {
  final String currentUid;
  final String receiverUid;

  GetMessagesEvent({
    required this.currentUid,
    required this.receiverUid,
  });
}
