abstract class VerifyUserRepo{
  Future<void> verifyUserEmail();

  Future<bool> checkUserVerified();
}