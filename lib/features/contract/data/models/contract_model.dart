// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContractModel {
  final Timestamp date;
  final double amount;
  final String clientId;
  final String serviceProviderId;
  final bool contractStrated;
  final bool paymentApproved;
  final bool contractEnded;
  final String paymentId;
  final String contractName;
  final String? contractId;
  ContractModel({
    required this.date,
    required this.amount,
    required this.clientId,
    required this.serviceProviderId,
    required this.contractStrated,
    required this.paymentApproved,
    required this.contractEnded,
    required this.paymentId,
    required this.contractName,
    this.contractId,
  });

  ContractModel copyWith({
    Timestamp? date,
    double? amount,
    String? clientId,
    String? serviceProviderId,
    bool? contractStrated,
    bool? paymentApproved,
    bool? contractEnded,
    String? paymentId,
    String? contractName,
    String? contractId,
  }) {
    return ContractModel(
      date: date ?? this.date,
      amount: amount ?? this.amount,
      clientId: clientId ?? this.clientId,
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
      contractStrated: contractStrated ?? this.contractStrated,
      paymentApproved: paymentApproved ?? this.paymentApproved,
      contractEnded: contractEnded ?? this.contractEnded,
      paymentId: paymentId ?? this.paymentId,
      contractName: contractName ?? this.contractName,
      contractId: contractId ?? this.contractId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'amount': amount,
      'clientId': clientId,
      'serviceProviderId': serviceProviderId,
      'contractStrated': contractStrated,
      'paymentApproved': paymentApproved,
      'contractEnded': contractEnded,
      'paymentId': paymentId,
      'contractName': contractName,
      'contractId': contractId,
    };
  }

  factory ContractModel.fromMap(Map<String, dynamic> map, String contractId) {
    return ContractModel(
      date: map['date'] as Timestamp,
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      serviceProviderId: map['serviceProviderId'] as String,
      contractStrated: map['contractStrated'] as bool,
      paymentApproved: map['paymentApproved'] as bool,
      contractEnded: map['contractEnded'] as bool,
      paymentId: map['paymentId'] as String,
      contractName: map['contractName'] as String,
      contractId: contractId,
    );
  }

  String toJson() => json.encode(toMap());

  // factory ContractModel.fromJson(String source) =>
  //     ContractModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContractModel(date: $date, amount: $amount, clientId: $clientId, serviceProviderId: $serviceProviderId, contractStrated: $contractStrated, paymentApproved: $paymentApproved, contractEnded: $contractEnded, paymentId: $paymentId, contractName: $contractName, contractId: $contractId)';
  }

  @override
  bool operator ==(covariant ContractModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.amount == amount &&
        other.clientId == clientId &&
        other.serviceProviderId == serviceProviderId &&
        other.contractStrated == contractStrated &&
        other.paymentApproved == paymentApproved &&
        other.contractEnded == contractEnded &&
        other.paymentId == paymentId &&
        other.contractName == contractName &&
        other.contractId == contractId;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        amount.hashCode ^
        clientId.hashCode ^
        serviceProviderId.hashCode ^
        contractStrated.hashCode ^
        paymentApproved.hashCode ^
        contractEnded.hashCode ^
        paymentId.hashCode ^
        contractName.hashCode ^
        contractId.hashCode;
  }
}
