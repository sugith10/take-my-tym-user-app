import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/utils/time_stamp_to_date.dart';
import '../../../../core/widgets/home_padding.dart';
import '../bloc/wallet_bloc/wallet_bloc.dart';
import '../widgets/no_transaction_widget.dart';
import '../widgets/transaction_tile.dart';
import '../widgets/transactions_view_setup_widget.dart';
import '../widgets/wallet_card_widget.dart';
import '../widgets/wallet_shimmer_widget.dart';
import 'all_transactions_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return BlocConsumer<WalletBloc, WalletState>(
      listener: (context, state) {
        if (state is WalletInitialState) {}
      },
      builder: (context, state) {
        if (state is WalletInitialState) {
          return const HomePadding(
            child: Column(
              children: [
                WalletCard(),
                Divider(),
                WalletMessageWidget(type: false)
              ],
            ),
          );
        }
        if (state is WalletLoadingState) {
          return const WalletShimmerWidget();
        }
        if (state is WalletLoadedState) {
          return HomePadding(
            child: Column(
              children: [
                WalletCard(balance: state.balance),
                const Divider(),
                if (state.transactions.isNotEmpty)
                  Column(
                    children: [
                      TransactionsViewSetupWidget(
                        viewAll: () {
                          Navigator.push(
                            context,
                            TransactionsPage.route(
                              transactions: state.transactions,
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.transactions.length > 10
                              ? 10
                              : state.transactions.length,
                          itemBuilder: (context, index) {
                            final transactionModel = state.transactions[index];
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: TransactionTile(
                                type: transactionModel.transactionType,
                                time:
                                    timestampToDate(transactionModel.timestamp),
                                amount: transactionModel.amount.toString(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                if (state.transactions.isEmpty)
                  const WalletMessageWidget(type: true)
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
