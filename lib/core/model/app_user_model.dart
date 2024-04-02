class AppUserModel {
  String uid;
  String email;
  bool verified;
  String firstName;
  String? lastName;
  String? picture;
  List<String>? buyTymPost;
  List<String>? sellTymPost;

  AppUserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    this.lastName,
    this.picture,
    this.buyTymPost,
    this.sellTymPost,
    this.verified = false,
  });

  factory AppUserModel.fromMap(Map<String, dynamic> data) {
    return AppUserModel(
      uid: data['uid'] as String,
      email: data['email'] as String,
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String?,
      picture: data['picture'] as String?,
      buyTymPost: data['buyTymPost'] as List<String>?,
      sellTymPost: data['sellTymPost'] as List<String>?,
      verified: data['verified'] as bool,
    );
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
      'verified': verified,
    };
  }

  @override
  String toString() {
    return "AppUserModel -> $uid $email $firstName $lastName $picture, $verified";
  }
}
