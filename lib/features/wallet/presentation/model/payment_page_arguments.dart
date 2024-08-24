import '../../data/models/wallet_model.dart';
import '../util/wallet_action_type.dart';

final class PaymentPageArguments {
  final WalletAction type;
  final double? amount;
  final WalletModel? walletModel;

  PaymentPageArguments({
    required this.type,
    required this.amount,
    required this.walletModel,
  });
}
