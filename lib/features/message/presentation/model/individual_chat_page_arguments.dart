import '../bloc/individual_message_bloc/individual_message_bloc.dart';

final class IndividualChatPageArguments {
   final String receiverUid;
  final String currentUid;
  final String receiverName;
  final IndividualMessageBloc individualMessageBloc;


  IndividualChatPageArguments({
    required this.receiverUid,
    required this.currentUid,
    required this.receiverName,
    required this.individualMessageBloc,
  });
}
