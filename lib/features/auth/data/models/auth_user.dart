import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUserModel extends Equatable {
  final String? token;
  final int? expiresIn;
  final String? id;
  final String? email;
  // final String? name;
  // final String? picture;

  const AuthUserModel({
    this.token,
    this.expiresIn,
    this.id,
    this.email,
    // required this.name,
    // this.picture,
  });

  factory AuthUserModel.fromMap(Map<String, dynamic> data) {
    return AuthUserModel(
      token: data['token'] as String?,
      expiresIn: data['expiresIn'] as int?,
      id: data['id'] as String?,
      email: data['email'] as String?,
      // name: data['']
    );
  }

  @override
  String toString() {
    return "";
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
