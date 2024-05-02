import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';
import 'package:take_my_tym/features/wallet/domain/repositories/wallet_repo.dart';

class WalletUseCase {
  final WalletRepo _walletRepo;

  WalletUseCase(this._walletRepo);

  Future<WalletModel> walletBalance({
    required String uid,
  }) async {
    return await _walletRepo.getWalletBalance(
      uid: uid,
    );
  }
}
