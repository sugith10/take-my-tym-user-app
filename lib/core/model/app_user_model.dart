// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String uid;
  String email;
  bool verified;
  String firstName;
  String lastName;
  String userName;
  String? picture;
  String? about;
  String? location;
  double? latitude;
  double? longitude;
  String? profession;
  UserModel({
    required this.uid,
    required this.email,
    required this.verified,
    required this.firstName,
    required this.lastName,
    required this.userName,
    this.picture,
    this.about,
    this.location,
    this.latitude,
    this.longitude,
    this.profession,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    bool? verified,
    String? firstName,
    String? lastName,
    String? userName,
    String? picture,
    String? about,
    String? location,
    double? latitude,
    double? longitude,
    String? profession,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      verified: verified ?? this.verified,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      picture: picture ?? this.picture,
      about: about ?? this.about,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      profession: profession ?? this.profession,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'verified': verified,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'picture': picture,
      'about': about,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'profession': profession,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      verified: map['verified'] as bool,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      userName: map['userName'] as String,
      picture: map['picture'] != null ? map['picture'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      profession:
          map['profession'] != null ? map['profession'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, verified: $verified, firstName: $firstName, lastName: $lastName, userName: $userName, picture: $picture, about: $about, location: $location, latitude: $latitude, longitude: $longitude, profession: $profession)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.verified == verified &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.userName == userName &&
        other.picture == picture &&
        other.about == about &&
        other.location == location &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.profession == profession;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        verified.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        userName.hashCode ^
        picture.hashCode ^
        about.hashCode ^
        location.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        profession.hashCode;
  }
}
