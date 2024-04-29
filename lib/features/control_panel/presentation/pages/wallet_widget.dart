import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_assets.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/control_panel/presentation/widgets/transaction_tile.dart';
import 'package:take_my_tym/features/control_panel/presentation/widgets/transactions_view_setup_widget.dart';
import 'package:take_my_tym/features/control_panel/presentation/widgets/wallet_card_widget.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const WalletCard(
            balance: 14235.34,
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          TransactionsViewSetupWidget(
            function: () {},
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 400.h,
                maxWidth: 800.h,
              ),
              child: ListView.builder(
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TransactionTile(
                        name: 'Fletcher',
                        image: MyAppImages.testProfile,
                        time: '15 Dec, 5:00 PM',
                        amount: '15,000',
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
