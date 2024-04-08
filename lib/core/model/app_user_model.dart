class AppUserModel {
  String uid;
  String email;
  bool verified;
  String firstName;
  String lastName;
  String userName;
  String? picture;
  String? location;
  String? about;

  AppUserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userName,
    this.picture,
    this.verified = false,
    this.about,
    this.location,
  });

  factory AppUserModel.fromMap(Map<String, dynamic> data) {
    return AppUserModel(
      uid: data['uid'] as String,
      email: data['email'] as String,
      verified: data['verified'] as bool,
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String,
      userName: data['userName'] as String,
      picture: data['picture'] as String?,
      about: data['about'] as String?,
      location: data['location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'verified': verified,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'picture': picture,
      'about': about,
      'location': location,
    };
  }

  @override
  String toString() {
    return "AppUserModel -> $uid $email $firstName $lastName $picture, $verified, $userName";
  }
}
