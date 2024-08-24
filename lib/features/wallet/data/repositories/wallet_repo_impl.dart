import 'package:take_my_tym/features/wallet/data/datasources/remote/wallet_remote_data.dart';
import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';
import 'package:take_my_tym/features/wallet/domain/repositories/wallet_repo.dart';

class WalletRepoImpl implements WalletRepo {
  final WalletRemoteData _walletRemoteData;

  WalletRepoImpl(this._walletRemoteData);
  @override
  Future<WalletModel> getWalletBalance({
    required String uid,
  }) async {
    return await _walletRemoteData.getWalletBalance(
      uid: uid,
    );
  }
}
