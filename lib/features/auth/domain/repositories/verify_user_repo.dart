abstract interface class VerifyUserRepo{
  Future<void> verifyUserEmail();

  Future<bool> checkUserVerified();
}