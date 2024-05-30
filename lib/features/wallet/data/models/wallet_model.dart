import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:take_my_tym/core/utils/file_formatter.dart';
import 'package:take_my_tym/features/wallet/data/models/transaction_model.dart';

class WalletModel {
  double balance;
  List<TransactionModel> transactions;
  WalletModel({
    required this.balance,
    required this.transactions,
  });

  WalletModel copyWith({
    double? balance,
    List<TransactionModel>? transactions,
  }) {
    return WalletModel(
      balance: balance ?? this.balance,
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'balance': balance,
      'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      balance:firebaseNumberToDouble(map['balance']),
      transactions: List<TransactionModel>.from(
        (map['transactions'] as List<dynamic>).map<TransactionModel>(
          (x) => TransactionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletModel.fromJson(String source) =>
      WalletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WalletModel(balance: $balance, transactions: $transactions)';

  @override
  bool operator ==(covariant WalletModel other) {
    if (identical(this, other)) return true;

    return other.balance == balance &&
        listEquals(other.transactions, transactions);
  }

  @override
  int get hashCode => balance.hashCode ^ transactions.hashCode;
}
