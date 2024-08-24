import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

 final class MessageModel {
  final String senderUid;
  final String receiverUid;
  final String message;
  final Timestamp timestamp;
  MessageModel({
    required this.senderUid,
    required this.receiverUid,
    required this.message,
    required this.timestamp,
  });

  MessageModel copyWith({
    String? senderUid,
    String? receiverUid,
    String? message,
    Timestamp? timestamp,
  }) {
    return MessageModel(
      senderUid: senderUid ?? this.senderUid,
      receiverUid: receiverUid ?? this.receiverUid,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderUid': senderUid,
      'receiverUid': receiverUid,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderUid: map['senderUid'] as String,
      receiverUid: map['receiverUid'] as String,
      message: map['message'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(senderUid: $senderUid, receiverUid: $receiverUid, message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.senderUid == senderUid &&
      other.receiverUid == receiverUid &&
      other.message == message &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return senderUid.hashCode ^
      receiverUid.hashCode ^
      message.hashCode ^
      timestamp.hashCode;
  }
}
