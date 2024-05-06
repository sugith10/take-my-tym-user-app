import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class OfferModel {
  final String postId;
  final String applicantUid;
  final Timestamp proposelDate;
  final String message;
  OfferModel({
    required this.postId,
    required this.applicantUid,
    required this.proposelDate,
    required this.message,
  });

  OfferModel copyWith({
    String? postId,
    String? applicantUid,
    Timestamp? proposelDate,
    String? message,
  }) {
    return OfferModel(
      postId: postId ?? this.postId,
      applicantUid: applicantUid ?? this.applicantUid,
      proposelDate: proposelDate ?? this.proposelDate,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'applicantUid': applicantUid,
      'proposelDate': proposelDate,
      'message': message,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      postId: map['postId'] as String,
      applicantUid: map['applicantUid'] as String,
      proposelDate: map['proposelDate'] as Timestamp,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) => OfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferModel(postId: $postId, applicantUid: $applicantUid, proposelDate: $proposelDate, message: $message)';
  }

  @override
  bool operator ==(covariant OfferModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.postId == postId &&
      other.applicantUid == applicantUid &&
      other.proposelDate == proposelDate &&
      other.message == message;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
      applicantUid.hashCode ^
      proposelDate.hashCode ^
      message.hashCode;
  }
}
