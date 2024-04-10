import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/features/message/data/datasources/remote/chat_service.dart';
import 'package:take_my_tym/features/message/domain/repositories/chat_list_repo.dart';

final class ChatListRepoImp implements ChatListRepo {
  final MessageRemoteData _messageRemoteData;

  ChatListRepoImp(this._messageRemoteData);
  @override
  Stream<DocumentSnapshot> getChatList({required String userId}) {
    return _messageRemoteData.getChatList(currentUid: userId);
  }
}
