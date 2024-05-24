import 'package:flutter/material.dart';

import '../../../../core/utils/theme/color/app_colors.dart';
import '../../../../core/widgets/submit_button.dart';
import '../util/wallet_action_type.dart';

class PayButton extends StatelessWidget {
  final VoidCallback callback;
  final WalletAction type;
  const PayButton({
    super.key,
    required this.callback,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final String text = type == WalletAction.widthdraw ? 'Withdraw' : 'Pay Now';
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SubmitButton(
        callback: () async {
          callback();
        },
        text: "$text ➪",
        foregroundColor: AppDarkColor.instance.primaryText,
        backgroundColor: AppDarkColor.instance.success,
      ),
    );
  }
}
