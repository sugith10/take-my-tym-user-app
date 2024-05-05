// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final Timestamp timestamp;
  final double amount;
  ///credit==true-debit==false
  final bool transactionType;
  TransactionModel({
    required this.timestamp,
    required this.amount,
    required this.transactionType,
  });

  TransactionModel copyWith({
    Timestamp? timestamp,
    double? amount,
    bool? transactionType,
  }) {
    return TransactionModel(
      timestamp: timestamp ?? this.timestamp,
      amount: amount ?? this.amount,
      transactionType: transactionType ?? this.transactionType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timestamp': timestamp,
      'amount': amount,
      'transactionType': transactionType,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      timestamp: map['timestamp'] as Timestamp,
      amount: map['amount'] as double,
      transactionType: map['transactionType'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TransactionModel(timestamp: $timestamp, amount: $amount, transactionType: $transactionType)';

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.timestamp == timestamp &&
        other.amount == amount &&
        other.transactionType == transactionType;
  }

  @override
  int get hashCode =>
      timestamp.hashCode ^ amount.hashCode ^ transactionType.hashCode;
}
