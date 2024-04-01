import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUserModel extends Equatable {
  final String? uid;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? picture;
  final List<String>? buyTymPost;
  final List<String>? sellTymPost;

  const AuthUserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.picture,
    this.buyTymPost,
    this.sellTymPost,
  });

  factory AuthUserModel.fromMap(Map<String, dynamic> data) {
    return AuthUserModel(
        uid: data['uid'] as String?,
        email: data['email'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        picture: data['picture'] as String?,
        buyTymPost: data['buyTymPost'] as List<String>?,
        sellTymPost: data['sellTymPost'] as List<String>?);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
      'buyTymPost': buyTymPost,
      'sellTymPost': sellTymPost,
    };
  }

  @override
  String toString() {
    return "AuthUserModel -> $uid $email $firstName $lastName $picture";
  }

  @override
  List<Object?> get props => [uid, email];
}
