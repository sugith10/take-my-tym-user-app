import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/features/message/data/models/message_model.dart';

class MessageRemoteData {
  Future<void> sendMessage({
    required String currentUid,
    required String receiverUid,
    required String message,
    required String senderName,
    required String receiverName,
  }) async {
    log('on send message remote');

    final Timestamp timestamp = Timestamp.now();

    //create a new message
    MessageModel newMessage = MessageModel(
      senderUid: currentUid,
      receiverUid: receiverUid,
      message: message,
      timestamp: timestamp,
    );

    //construct chat room ID for the two users (sorted to ensure uniqueness)
    List<String> ids = [currentUid, receiverUid];
    ids.sort(); //sort the ids (this ensure the chatroomID is the smae for any 2 people)
    String chatroomID = ids.join('_');

    final fireStore = FirebaseFirestore.instance
        .collection("chats")
        .doc("EYYn66HdjFf8XJVCXQdP");
    try {
      //stored the message inside the firebase
      await fireStore
          .collection("chatRooms")
          .doc(chatroomID)
          .collection("messages")
          .add(newMessage.toMap())
          .then(
        //after the write succes saving the id inside another collection
        (value) async {
          final dataDoc =
              await fireStore.collection("userChats").doc(currentUid).get();

          final Map<String, dynamic>? data = dataDoc.data();

          if (data != null && data.containsKey(chatroomID)) {
            log("chataRoom data already exists $chatroomID");
          } else {
            await fireStore
                .collection("userChats")
                .doc(currentUid)
                .set({chatroomID: senderName});

            await fireStore
                .collection("userChats")
                .doc(receiverUid)
                .set({chatroomID: receiverUid});
          }
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  //Get messages
  Stream<QuerySnapshot> getMessages({
    required String currentUid,
    required String receiverUid,
  }) {
    log('on get message remote');
    //construct a chatroom ID for two users
    List<String> ids = [currentUid, receiverUid];
    ids.sort();
    String chatroomID = ids.join('_');
    return FirebaseFirestore.instance
        .collection("chats")
        .doc("EYYn66HdjFf8XJVCXQdP")
        .collection("chatRooms")
        .doc(chatroomID) // Use the constructed chatroomID here
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  //Message List
  Stream<DocumentSnapshot> getChatList({required String currentUid}) {
    log('on Chat list message remote');
    return FirebaseFirestore.instance
        .collection("chats")
        .doc("EYYn66HdjFf8XJVCXQdP")
        .collection("userChats")
        .doc(currentUid)
        .snapshots();
 
  }
}
