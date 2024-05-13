import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../../core/widgets/submit_button.dart';
import '../../../wallet/presentation/pages/payment_page.dart';
import '../../../wallet/presentation/util/wallet_action_type.dart';

class AcceptOfferWidget extends StatelessWidget {
  final VoidCallback reject;
  final VoidCallback accept;
  const AcceptOfferWidget({
    required this.accept,
    required this.reject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: MyAppPadding.homePadding),
        Expanded(
          child: SubmitButton(
            text: "Reject",
            backgroundColor: AppDarkColor.instance.danger,
            foregroundColor: AppDarkColor.instance.primaryText,
            callback: () {
              AppDialog.show(
                context: context,
                title: "Reject Offer",
                subtitle: "Lorem Ipsum is simply dummy text",
                action: "Reject",
                actionCall: () {
                  Navigator.pop(context);
                  reject();
                },
              );
            },
          ),
        ),
        Expanded(
          child: SubmitButton(
            text: "Accept",
            backgroundColor: AppDarkColor.instance.success,
            foregroundColor: AppDarkColor.instance.primaryText,
            callback: () {
              AppDialog.show(
                context: context,
                title: "Accept Offer",
                subtitle: "Lorem Ipsum is simply dummy text",
                action: "Accept",
                actionCall: () {
                  Navigator.pop(context);
                  accept();
                },
                actionColor: AppDarkColor.instance.success,
              );
            },
          ),
        ),
        const SizedBox(width: MyAppPadding.homePadding),
      ],
    );
  }
}
