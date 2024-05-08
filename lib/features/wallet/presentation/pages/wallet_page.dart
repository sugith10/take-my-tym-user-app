import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/time_stamp_to_date.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/wallet/presentation/bloc/wallet_bloc/wallet_bloc.dart';
import 'package:take_my_tym/features/wallet/presentation/pages/all_transactions_page.dart';
import 'package:take_my_tym/features/wallet/presentation/widgets/transaction_tile.dart';
import 'package:take_my_tym/features/wallet/presentation/widgets/transactions_view_setup_widget.dart';
import 'package:take_my_tym/features/wallet/presentation/widgets/wallet_card_widget.dart';
import 'package:take_my_tym/features/wallet/presentation/widgets/wallet_shimmer_widget.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        if (state is WalletLoadingState) {
          return const WalletShimmerWidget();
        }
        if (state is WalletLoadedState) {
          return HomePadding(
            child: Column(
              children: [
                const SizedBox(height: 20),
                WalletCard(balance: state.balance),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                TransactionsViewSetupWidget(
                  viewAll: () {
                    Navigator.push(
                        context,
                        TransactionsPage.route(
                          transactions: state.transactions,
                        ));
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 400.h,
                      maxWidth: 800.h,
                    ),
                    child: ListView.builder(
                      itemCount: state.transactions.length > 10 ? 10 : state.transactions.length,
                      itemBuilder: (context, index) {
                        final transactionModel = state.transactions[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: TransactionTile(
                            type: transactionModel.transactionType,
                            time: timestampToDate(transactionModel.timestamp),
                            amount: transactionModel.amount.toString(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
      // buildWhen: (previous, current) {
      //   return  current is WalletLoadedState && previous != WalletLoadedState;
      // },
    );
  }
}
