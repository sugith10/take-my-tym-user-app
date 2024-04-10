import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatListRepo {
  Stream<DocumentSnapshot> getChatList({required String userId});
}
