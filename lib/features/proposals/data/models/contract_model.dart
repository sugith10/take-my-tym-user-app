import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContractModel {
  final Timestamp date;
  final double amount;
  final String clientId;
  final String serviceProviderId;
  final bool contractStrated;
  final bool contractFail;
  final bool contractEnded;
  ContractModel({
    required this.date,
    required this.amount,
    required this.clientId,
    required this.serviceProviderId,
    required this.contractStrated,
    required this.contractFail,
    required this.contractEnded,
  });

  ContractModel copyWith({
    Timestamp? date,
    double? amount,
    String? clientId,
    String? serviceProviderId,
    bool? contractStrated,
    bool? contractFail,
    bool? contractEnded,
  }) {
    return ContractModel(
      date: date ?? this.date,
      amount: amount ?? this.amount,
      clientId: clientId ?? this.clientId,
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
      contractStrated: contractStrated ?? this.contractStrated,
      contractFail: contractFail ?? this.contractFail,
      contractEnded: contractEnded ?? this.contractEnded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'amount': amount,
      'clientId': clientId,
      'serviceProviderId': serviceProviderId,
      'contractStrated': contractStrated,
      'contractFail': contractFail,
      'contractEnded': contractEnded,
    };
  }

  factory ContractModel.fromMap(Map<String, dynamic> map) {
    return ContractModel(
      date: map['date'] as Timestamp,
      amount: map['amount'] as double,
      clientId: map['clientId'] as String,
      serviceProviderId: map['serviceProviderId'] as String,
      contractStrated: map['contractStrated'] as bool,
      contractFail: map['contractFail'] as bool,
      contractEnded: map['contractEnded'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContractModel.fromJson(String source) =>
      ContractModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContractModel(date: $date, amount: $amount, clientId: $clientId, serviceProviderId: $serviceProviderId, contractStrated: $contractStrated, contractFail: $contractFail, contractEnded: $contractEnded)';
  }

  @override
  bool operator ==(covariant ContractModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.amount == amount &&
        other.clientId == clientId &&
        other.serviceProviderId == serviceProviderId &&
        other.contractStrated == contractStrated &&
        other.contractFail == contractFail &&
        other.contractEnded == contractEnded;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        amount.hashCode ^
        clientId.hashCode ^
        serviceProviderId.hashCode ^
        contractStrated.hashCode ^
        contractFail.hashCode ^
        contractEnded.hashCode;
  }
}
