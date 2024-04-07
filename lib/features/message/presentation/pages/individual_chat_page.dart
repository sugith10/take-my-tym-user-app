import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/default_appbar.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_text_field.dart';

class IndividualChatPage extends StatelessWidget {
  final String receiverUid;
  final String currentUid;
  const IndividualChatPage(
      {required this.currentUid, required this.receiverUid, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          leading: const BackButtonWidget(),
          callback: () {},
          actionIcon: Icons.more_vert_rounded),
      bottomNavigationBar: ChatTextField(
        currentUid: currentUid,
        receiverUid: receiverUid,
      ),
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
