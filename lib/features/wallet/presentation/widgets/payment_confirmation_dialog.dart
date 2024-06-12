import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/widgets/app_snackbar/app_snack_bar.dart';
import 'package:take_my_tym/features/wallet/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:take_my_tym/features/wallet/presentation/util/wallet_utils.dart';

import '../../../../core/theme/color/app_colors.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../data/models/wallet_model.dart';
import '../bloc/wallet_bloc/wallet_bloc.dart';
import '../util/wallet_action_type.dart';

class PaymentDialog {
  PaymentDialog._();
  static void show(
      {required BuildContext context,
      required String uid,
      required WalletAction type,
      required WalletModel? walletModel,
      required String amount,
      required PaymentBloc paymentBloc}) {
    if (WalletUtil.convert(amount)) {
      AppDialog.show(
        context: context,
        title: "$amount ₹ ",
        subtitle: "Are you sure you want to continue?",
        action: "Continue",
        actionCall: () {
          if (type == WalletAction.topUp) {
            paymentBloc.add(PaymentTopUpEvent(amount: amount));
            Navigator.pop(context);
          } else if (type == WalletAction.widthdraw) {
            context.read<WalletBloc>().add(WalletWithdrawEvent(
                uid: uid, amount: amount, walletModel: walletModel));
          } else if (type == WalletAction.transfer) {
            context
                .read<WalletBloc>()
                .add(WalletTransferEvent(uid: uid, amount: amount));
          }
        },
        actionColor: AppDarkColor.instance.success,
      );
    } else {
      AppSnackBar.failSnackBar(
        context: context,
        alert: AppAlert(
            alert: "Enter a valid amount",
            details: "The amount should be greater than 1"),
      );
    }
  }
}
