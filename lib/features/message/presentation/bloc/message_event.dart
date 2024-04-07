part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

final class StartChatEvent extends MessageEvent{}

final class DeleteMessageEvent extends MessageEvent {}

