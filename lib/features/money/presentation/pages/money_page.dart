import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_assets.dart';
import 'package:take_my_tym/core/widgets/app_bar_title.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/money/presentation/widgets/transactions_view_setup_widget.dart';
import 'package:take_my_tym/features/money/presentation/widgets/transaction_tile.dart';
import 'package:take_my_tym/features/money/presentation/widgets/wallet_card/wallet_card_widget.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Control Panel"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Contracts',
              ),
              Tab(text: 'Wallet'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Contracts"),
            ),
            MoneyWidget(),
          ],
        ),
      ),
    );
  }
}

class MoneyWidget extends StatelessWidget {
  const MoneyWidget({
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
