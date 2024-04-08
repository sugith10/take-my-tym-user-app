import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/features/message/domain/repositories/individual_message_repo.dart';

final class IndividualMessageUseCase {
  final IndividualMessageRepo _individualMessageRepo;
  IndividualMessageUseCase(this._individualMessageRepo);

  Future<void> sendMessage({
    required String currentUid,
    required String receiverUid,
    required String message,
  }) async {
    return await _individualMessageRepo.sendMessage(
      currentUid: currentUid,
      receiverUid: receiverUid,
      message: message,
    );
  }

   Stream<QuerySnapshot> getMessages({required String currentUid,
    required String receiverUid,}){
    return _individualMessageRepo.getMessages(currentUid: currentUid, receiverUid: receiverUid,);
  }
}
