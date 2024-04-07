import 'package:take_my_tym/features/message/data/datasources/remote/chat_service.dart';
import 'package:take_my_tym/features/message/domain/repositories/individual_message_repo.dart';

final class IndividualMessageRepoImpl implements IndividualMessageRepo {
  final MessageRemoteData _messageRemoteData;
  IndividualMessageRepoImpl(this._messageRemoteData);

  @override
  Future<void> sendMessage({
    required String currentUid,
    required String receiverUid,
    required String message,
  }) async {
    return await _messageRemoteData.sendMessage(
      currentUid: currentUid,
      receiverUid: receiverUid,
      message: message,
    );
  }
}
