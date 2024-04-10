part of 'individual_message_bloc.dart';

sealed class IndividualMessageState extends Equatable {
  const IndividualMessageState();

  @override
  List<Object> get props => [];
}

final class IndividualMessageInitial extends IndividualMessageState {}

final class MessageSendErrorState extends IndividualMessageState {}

final class IndividualChatsLoadedState extends IndividualMessageState {
  final Stream<QuerySnapshot> messages;

  const IndividualChatsLoadedState({required this.messages});

  @override
  List<Object> get props => [messages];
}