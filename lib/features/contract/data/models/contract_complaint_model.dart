// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContractComplaintModel {
  final String complaint;
  final String userId;
  final String contractId;
  ContractComplaintModel({
    required this.complaint,
    required this.userId,
    required this.contractId,
  });

  ContractComplaintModel copyWith({
    String? complaint,
    String? userId,
    String? contractId,
  }) {
    return ContractComplaintModel(
      complaint: complaint ?? this.complaint,
      userId: userId ?? this.userId,
      contractId: contractId ?? this.contractId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'complaint': complaint,
      'userId': userId,
      'contractId': contractId,
    };
  }

  factory ContractComplaintModel.fromMap(Map<String, dynamic> map) {
    return ContractComplaintModel(
      complaint: map['complaint'] as String,
      userId: map['userId'] as String,
      contractId: map['contractId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContractComplaintModel.fromJson(String source) => ContractComplaintModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ContractComplaintModel(complaint: $complaint, userId: $userId, contractId: $contractId)';

  @override
  bool operator ==(covariant ContractComplaintModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.complaint == complaint &&
      other.userId == userId &&
      other.contractId == contractId;
  }

  @override
  int get hashCode => complaint.hashCode ^ userId.hashCode ^ contractId.hashCode;
}
