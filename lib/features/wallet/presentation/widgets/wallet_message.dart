import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../util/wallet_action_type.dart';

class WalletMessage extends StatelessWidget {
  final WalletAction walletAction;
  const WalletMessage({
    required this.walletAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (walletAction == WalletAction.topUp) {
      return _title(context, "Add Money to Wallet");
    } else if (walletAction == WalletAction.widthdraw) {
      return _title(context, "Withdraw Your Money");
    } else {
      return _title(context, "");
    }
  }

  Text _title(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppDarkColor.instance.primaryTextSoft,
          ),
    );
  }
}
