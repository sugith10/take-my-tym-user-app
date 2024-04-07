// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderUid;
  final String receiverUid;
  final String message;
  final Timestamp timestamp;
  Message({
    required this.senderUid,
    required this.receiverUid,
    required this.message,
    required this.timestamp,
  });
  

  Message copyWith({
    String? senderUid,
    String? receiverUid,
    String? message,
    Timestamp? timestamp,
  }) {
    return Message(
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

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderUid: map['senderUid'] as String,
      receiverUid: map['receiverUid'] as String,
      message: map['message'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(senderUid: $senderUid, receiverUid: $receiverUid, message: $message, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant Message other) {
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
