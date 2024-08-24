import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';

abstract  interface class WalletRepo{
  Future<WalletModel> getWalletBalance({required String uid});
}