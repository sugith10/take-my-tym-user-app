abstract class IndividualMessageRepo {
  Future<void> sendMessage({
    required String currentUid,
    required String receiverUid,
    required String message,
  });
}
