import 'package:flutter/material.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/right_to_left.dart';
import 'package:take_my_tym/core/utils/time_stamp_to_date.dart';
import 'package:take_my_tym/core/widgets/common_app_bar.dart';
import 'package:take_my_tym/features/wallet/data/models/transaction_model.dart';
import 'package:take_my_tym/features/wallet/presentation/widgets/transaction_tile.dart';

class TransactionsPage extends StatelessWidget {
  final List<TransactionModel> transactios;
  const TransactionsPage({
    required this.transactios,
    
    super.key});
  static route ({required List<TransactionModel> transactions})=> rightToLeft( TransactionsPage(transactios: transactions,));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
      body: ListView.builder(
                      itemCount: transactios.length,
                      itemBuilder: (context, index) {
                        final transactionModel = transactios[index];
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
    );
  }
}