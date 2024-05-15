import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class OfferModel {
  final String postId;
  final bool tymType;
  final String applicantUid;
  final Timestamp proposelDate;
  final String message;
  final String? offerId;
  OfferModel({
    required this.postId,
    required this.tymType,
    required this.applicantUid,
    required this.proposelDate,
    required this.message,
    this.offerId,
  });

  OfferModel copyWith({
    String? postId,
    bool? tymType,
    String? applicantUid,
    Timestamp? proposelDate,
    String? message,
  }) {
    return OfferModel(
      postId: postId ?? this.postId,
      tymType: tymType ?? this.tymType,
      applicantUid: applicantUid ?? this.applicantUid,
      proposelDate: proposelDate ?? this.proposelDate,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'tymType': tymType,
      'applicantUid': applicantUid,
      'proposelDate': proposelDate,
      'message': message,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map, String offerId) {
    return OfferModel(
      postId: map['postId'] as String,
      tymType: map['tymType'] as bool,
      applicantUid: map['applicantUid'] as String,
      proposelDate: map['proposelDate'],
      message: map['message'] as String,
      offerId: offerId,
    );
  }

  String toJson() => json.encode(toMap());

  // factory OfferModel.fromJson(String source) =>
  //     OfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferModel(postId: $postId, tymType: $tymType, applicantUid: $applicantUid, proposelDate: $proposelDate, message: $message)';
  }

  @override
  bool operator ==(covariant OfferModel other) {
    if (identical(this, other)) return true;

    return other.postId == postId &&
        other.tymType == tymType &&
        other.applicantUid == applicantUid &&
        other.proposelDate == proposelDate &&
        other.message == message;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        tymType.hashCode ^
        applicantUid.hashCode ^
        proposelDate.hashCode ^
        message.hashCode;
  }
}
