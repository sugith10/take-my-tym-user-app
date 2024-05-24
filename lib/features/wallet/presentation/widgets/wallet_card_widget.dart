import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/theme/color/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/features/wallet/presentation/pages/payment_page.dart';
import 'package:take_my_tym/features/wallet/presentation/util/wallet_action_type.dart';

import '../../data/models/wallet_model.dart';

class WalletCard extends StatelessWidget {
  final WalletModel? walletModel;
  const WalletCard({
    this.walletModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 300.h,
            maxWidth: 600.h,
          ),
          child: Container(
            height: 150.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppDarkColor.instance.gradientPrimary,
                  AppDarkColor.instance.gradientSecondary,
                ],
                center: Alignment.topLeft,
                radius: 0.9,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppRadius.borderRadius),
              ),
            ),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Main Balance',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 5),
                if (walletModel != null)
                  Text(
                    '₹${walletModel!.balance.toString()}',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                if (walletModel == null)
                  Text(
                    '****',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                const Spacer(),
                if (walletModel != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _TransactionButton(
                        icon: IconlyLight.arrow_up,
                        title: 'Top up',
                        callback: () {
                          Navigator.push(
                            context,
                            PaymentPage.route(type: WalletAction.topUp),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                        child: const VerticalDivider(),
                      ),
                      _TransactionButton(
                        icon: IconlyLight.arrow_down,
                        title: 'Withdraw',
                        callback: () {
                          Navigator.push(
                            context,
                            PaymentPage.route(
                                type: WalletAction.widthdraw,
                                walletModel: walletModel),
                          );
                        },
                      ),
                    ],
                  ),
                if (walletModel == null) const Text("Unlock Wallet"),
                const Spacer()
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _TransactionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback callback;
  const _TransactionButton({
    required this.icon,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
