// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubmitModel {
  final bool status;
  final String postId;
  final Timestamp timestamp;
  SubmitModel({
    required this.status,
    required this.postId,
    required this.timestamp,
  });
  

  SubmitModel copyWith({
    bool? status,
    String? postId,
    Timestamp? timestamp,
  }) {
    return SubmitModel(
      status: status ?? this.status,
      postId: postId ?? this.postId,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'postId': postId,
      'timestamp': timestamp,
    };
  }

  factory SubmitModel.fromMap(Map<String, dynamic> map) {
    return SubmitModel(
      status: map['status'] as bool,
      postId: map['postId'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubmitModel.fromJson(String source) => SubmitModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubmitModel(status: $status, postId: $postId, timestamp: $timestamp)';

  @override
  bool operator ==(covariant SubmitModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.postId == postId &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode => status.hashCode ^ postId.hashCode ^ timestamp.hashCode;
}
