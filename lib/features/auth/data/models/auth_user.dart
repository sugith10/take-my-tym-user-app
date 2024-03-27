import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUserModel extends Equatable {
  final String? token;
  final int? expiresIn;
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? picture;

  const AuthUserModel({
    this.token,
    this.expiresIn,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.picture,
  });

  factory AuthUserModel.fromMap(Map<String, dynamic> data) {
    return AuthUserModel(
      token: data['token'] as String?,
      expiresIn: data['expiresIn'] as int?,
      id: data['id'] as String?,
      email: data['email'] as String?,
      firstName: data['firstName'] as String?,
      lastName: data['lastName'] as String?,
      picture: data['picture'] as String?,
    );
  }

  @override
  String toString() {
    return "AuthUserModel -> $expiresIn $id $email $firstName $lastName $picture";
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
