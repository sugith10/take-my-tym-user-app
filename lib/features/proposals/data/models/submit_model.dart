// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SubmitModel {
  final bool status;
  final String postId;
  final bool postType;
  final Timestamp timestamp;
  final String? submitId;
  SubmitModel({
    required this.status,
    required this.postId,
    required this.postType,
    required this.timestamp,
    this.submitId,
  });

  SubmitModel copyWith({
    bool? status,
    String? postId,
    bool? postType,
    Timestamp? timestamp,
  }) {
    return SubmitModel(
      status: status ?? this.status,
      postId: postId ?? this.postId,
      postType: postType ?? this.postType,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'postId': postId,
      'postType': postType,
      'timestamp': timestamp,
    };
  }

  factory SubmitModel.fromMap(Map<String, dynamic> map, String submitId) {
    return SubmitModel(
      submitId: submitId,
      status: map['status'] as bool,
      postId: map['postId'] as String,
      postType: map['postType'] as bool,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  // factory SubmitModel.fromJson(String source) =>
  //     SubmitModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubmitModel(status: $status, postId: $postId, postType: $postType, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant SubmitModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.postId == postId &&
        other.postType == postType &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        postId.hashCode ^
        postType.hashCode ^
        timestamp.hashCode;
  }
}
