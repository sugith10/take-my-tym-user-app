import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/features/message/presentation/bloc/individual_message_bloc/individual_message_bloc.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_text_field.dart';

class IndividualChatPage extends StatelessWidget {
  final String receiverUid;
  final String currentUid;

  const IndividualChatPage({
    required this.currentUid,
    required this.receiverUid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<IndividualMessageBloc>().add(
        GetMessagesEvent(currentUid: currentUid, receiverUid: receiverUid));
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $receiverUid'),
      ),
      body: BlocBuilder<IndividualMessageBloc, IndividualMessageState>(
        builder: (context, state) {
          log(state.toString());
          if (state is GetMessagesLoaded) {
            log("get messages state");
            return StreamBuilder<QuerySnapshot>(
              stream: state.messages,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return _buildMessageItem(snapshot.data!.docs[index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: ChatTextField(
        currentUid: currentUid,
        receiverUid: receiverUid,
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot messageSnapshot) {
    final messageData = messageSnapshot.data() as Map<String, dynamic>;
    final message = messageData['message'] ?? 'hi';
    final senderUid = messageData['senderUid'] ?? 'hello';

    return ListTile(
      title: Text(message, style: TextStyle(color: Colors.white),),
      subtitle: Text(senderUid, style: TextStyle(color: Color.fromARGB(255, 4, 154, 230)),),
  
    );
  }
}







// class IndividualChatPage extends StatefulWidget {
//   //receiverEmail;
//   const IndividualChatPage({super.key});

//   @override
//   State<IndividualChatPage> createState() => _IndividualChatPageState();
// }

// class _IndividualChatPageState extends State<IndividualChatPage> {
//   final TextEditingController _controller = TextEditingController();

//   final ChatService _chatService = ChatService();

//   void sendMessage() async {
//     if (_controller.text.isNotEmpty) {
//       await _chatService.sendMessage(
//         "QkbZfvJpcuWtKrMsmHq09phXgC02",
//         _controller.text,
//       );
//       _controller.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: _buildMessageList(),
//       bottomNavigationBar: const ChatTextField(),
//     );
//   }

//   Widget _buildMessageList() {
//     return StreamBuilder(
//         stream: _chatService.getMessages(
//           "QkbZfvJpcuWtKrMsmHq09phXgC02",
//           "PBEkOtuZZNT7Ljpoo8hKuvg2XVC3",
//         ),
//         builder: (context, snapshot) {
//           //errors
//           if (snapshot.hasError) {
//             log("error");
//             return const Text("error");
//           }
//           //loading
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             log('loding');
//             return const Text("loading");
//           }
//           //success
//           log('success');
//           return ListView(
//             children: snapshot.data!.docs
//                 .map((doc) => _buildMssageItem(doc))
//                 .toList(),
//           );
//         });
//   }

//   Widget _buildMssageItem(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     bool isCurrentUser = data['senderID'] == "PBEkOtuZZNT7Ljpoo8hKuvg2XVC3";
//     log(data['senderID'].toString());
//     log(isCurrentUser.toString());
//     return Column(
//       children: [
//         Text(
//           data['message'],
//           textAlign: isCurrentUser ? TextAlign.right : TextAlign.left,
//         ),
//       ],
//     );
//   }
// }
