import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/utils/name_capitalize.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../../core/widgets/home_padding.dart';
import '../bloc/wallet_bloc/wallet_bloc.dart';
import '../widgets/no_transaction_widget.dart';
import '../widgets/transaction_tile.dart';
import '../widgets/transactions_view_setup_widget.dart';
import '../widgets/update_time_widget.dart';
import '../widgets/wallet_card_widget.dart';
import '../widgets/wallet_shimmer_widget.dart';
import 'transactions_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletBloc, WalletState>(
      listenWhen: (previousState, currentState) {
        if (currentState is WalletErrorState ||
            previousState is WalletErrorState) {
          return false;
        }
        log("current state $currentState");
        return true;
      },
      listener: (context, state) {
        if (state is WalletInitialState) {
          if (state.show) {
            AppDialog.show(
                context: context,
                title: "Unlock Your Wallet",
                subtitle: "Please unlock Wallet to continue",
                action: "Unlock",
                actionPop: true,
                actionCall: () {
                  context.read<WalletBloc>().add(
                        WalletBalanceEvent(
                            uid: context.read<AppUserBloc>().userModel!.uid),
                      );
                },
                actionColor: AppDarkColor.instance.success);
          }
        }
      },
      buildWhen: (previousState, currentState) {
        if (currentState is WalletErrorState ||
            previousState is WalletErrorState) {
          return false;
        }
        log("current state $currentState");
        return true;
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
                SizedBox(height: 10.h),
                WalletUpdateTimeWidget(
                  date: state.date,
                  time: state.time,
                ),
                SizedBox(height: 10.h),
                if (state.transactions.isNotEmpty)
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
                          time: TextManipulator.timestampToDate(
                              transactionModel.timestamp),
                          amount: transactionModel.amount.toString(),
                        ),
                      );
                    },
                  ),
                ),
                if (state.transactions.isEmpty)
                  const WalletMessageWidget(type: true)
              ],
            ),
          );
        }

        return Center(child: Text(state.toString()));
      },
    );
  }
}
