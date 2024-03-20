import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/features/money/presentation/widgets/transaction_view_cntrl_widget.dart';
import 'package:take_my_tym/features/money/presentation/widgets/transaction_widget.dart';
import 'package:take_my_tym/features/money/presentation/widgets/wallet_card/wallet_card_widget.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: MyAppPadding.homePadding, right: MyAppPadding.homePadding),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const WalletCard(
              balance: 14235.34,
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            TransactionViewCntrlWidget(
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
                        child: TransactionWidget(
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
      ),
    );
  }
}
