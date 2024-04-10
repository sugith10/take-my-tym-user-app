import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/features/message/domain/repositories/chat_list_repo.dart';

final class ChatListUseCase{
  final ChatListRepo _chatListRepo;
  ChatListUseCase(this._chatListRepo);

  Stream<DocumentSnapshot>  getChatList({required String userId}){
    return _chatListRepo.getChatList(userId: userId);
  }
}