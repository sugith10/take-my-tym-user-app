// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserMessageModel {
  final String messageId;
  final String name;
  UserMessageModel({
    required this.messageId,
    required this.name,
  });

  UserMessageModel copyWith({
    String? messageId,
    String? name,
  }) {
    return UserMessageModel(
      messageId: messageId ?? this.messageId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageId': messageId,
      'name': name,
    };
  }

  factory UserMessageModel.fromMap(Map<String, dynamic> map) {
    return UserMessageModel(
      messageId: map['messageId'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMessageModel.fromJson(String source) => UserMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserMessageModel(messageId: $messageId, name: $name)';

  @override
  bool operator ==(covariant UserMessageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.messageId == messageId &&
      other.name == name;
  }

  @override
  int get hashCode => messageId.hashCode ^ name.hashCode;
}
