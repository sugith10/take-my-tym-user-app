import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/features/message/data/models/message_model.dart';

class MessageRemoteData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendMessage({
    required String currentUid,
    required String receiverUid,
    required String message,
  }) async {
    //get current user info
    // final String currentUid = _auth.currentUser!.uid;
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

    // add new message to database
    await _firestore
        .collection("chatRooms")
        .doc(chatroomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //Get messages
  Stream<QuerySnapshot> getMessages(String currentUid, String otherUid) {
    //construct a chatroom ID for two users
    List<String> ids = [currentUid, otherUid];
    ids.sort();
    String chatroomID = ids.join('_');

    return _firestore
        .collection("chatRooms")
        .doc(chatroomID) // Use the constructed chatroomID here
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
