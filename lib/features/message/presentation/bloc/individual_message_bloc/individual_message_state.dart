part of 'individual_message_bloc.dart';

sealed class IndividualMessageState  {
   IndividualMessageState();


}

final class IndividualMessageInitial extends IndividualMessageState {}

final class MessageSendErrorState extends IndividualMessageState {}

final class IndividualChatsLoadedState extends IndividualMessageState {
  final Stream<QuerySnapshot> messages;
  final Stream<DocumentSnapshot> userInfo;

   IndividualChatsLoadedState({
    required this.messages,
    required this.userInfo,
  });

}
