import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  /// Determines the type of transaction: `true` for buytym, `false` for selltym.
  final bool tymType;

  /// User ID of the post creator
  final String uid;

  /// Unique identifier for the post
  /// Initially `null` when created, `postId` uniquely identifies each post after being assigned by the backend.
  final String? postId;

  /// Name of the user who created the post
  final String userName;

  /// Date and time when the post was created
  final Timestamp postDate;

  /// Type of work
  final String workType;

  /// Title of the post
  final String title;
  /// Image URL associated with the post (optional)
  final String? image; 

  /// Content of the post
  final String content; 

  // List of skills required for the post
  final List<dynamic> skills; 

  /// Location of the post
  final String location; 

  /// Skill level required for the post
  final String skillLevel; 

  /// Price associated with the post
  final double price; 

  /// Latitude of the post location
  final double latitude; 

  /// Longitude of the post location
  final double longitude;

  const PostModel({
    required this.tymType,
    required this.uid,
    this.postId,
    required this.userName,
    required this.postDate,
    required this.workType,
    required this.title,
    required this.content,
    required this.location,
    required this.latitude,
    required this.longitude,
    this.image,
    required this.skillLevel,
    required this.price,
    required this.skills,
  });

  // Equatable props for comparing instances
  @override
  List<Object> get props => [
        uid,
        tymType,
        userName,
        postDate,
        workType,
        title,
        content,
        location,
        skillLevel,
        price,
        skills,
        latitude,
        longitude,
      ];

  // Convert PostModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'tymType': tymType,
      'uid': uid,
      'workType': workType,
      'title': title,
      'userName': userName,
      'postDate': postDate,
      'image': image,
      'content': content,
      'location': location,
      'skillLevel': skillLevel,
      'price': price,
      'skills': skills,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Factory method to create a PostModel instance from a map
  factory PostModel.fromMap(Map<String, dynamic> map,
      {required String postId}) {
    return PostModel(
      tymType: map['tymType'],
      uid: map['uid'],
      workType: map['workType'],
      title: map['title'],
      userName: map['userName'],
      postDate: map['postDate'] as Timestamp,
      image: map['image'] != null ? map['image'] as String : null,
      content: map['content'],
      location: map['location'],
      skillLevel: map['skillLevel'],
      price: map['price'],
      skills: map['skills'] as List<dynamic>,
      postId: postId,
      longitude: map['longitude'],
      latitude: map['latitude'],
    );
  }

  // Factory method to create a PostModel instance from a Firestore document snapshot
  factory PostModel.fromSnapshot(DocumentSnapshot snapshot) {
    return PostModel(
      tymType: snapshot['tymType'],
      uid: snapshot['uid'],
      workType: snapshot['workType'],
      title: snapshot['title'],
      content: snapshot['content'],
      userName: snapshot['userName'],
      location: snapshot['location'],
      skillLevel: snapshot['skillLevel'],
      price: snapshot['price'],
      postDate: (snapshot['postDate'] as Timestamp),
      skills: List<String>.from(snapshot['skills']),
      latitude: snapshot['latitude'],
      longitude: snapshot['longitude'],
    );
  }
}
