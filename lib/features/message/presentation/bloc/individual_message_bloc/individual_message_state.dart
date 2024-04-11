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
  final Stream<DocumentSnapshot> userInfo;

  const IndividualChatsLoadedState({
    required this.messages,
    required this.userInfo,
  });

  @override
  List<Object> get props => [messages];
}
