import 'package:equatable/equatable.dart';

/// Represents a post made by a user, detailing a specific task or job offer/request.
///
/// The post includes various details such as the type of transaction (buy/sell),
/// the geographic location, skills required, and other relevant information.
class PostModel extends Equatable {
  /// Determines the type of transaction: `true` for buying tym, `false` for selling tym.
  final bool tymType;

  /// The unique identifier for the user who created the post.
  final String uid;

  /// An optional unique identifier for the post.
  ///
  /// This field is used to uniquely identify each post within the system. When a new post is created
  /// locally or initially submitted to the server, `postId` is typically `null` because it has not yet
  /// been assigned an identifier by the server. 
  ///
  /// Once the post is saved and acknowledged by the backend, it is assigned a unique `postId` which is 
  /// then used for retrieving, updating, or deleting the post in subsequent operations. This identifier
  /// ensures each post can be uniquely distinguished from others, even if other attributes such as the
  /// title or content are identical.
  ///
  /// Usage Note:
  /// - `null` when creating a new post that has not been submitted to the server.
  /// - Non-null when fetching an existing post from the server, where it has been assigned a unique identifier.
  final String? postId;


  /// The name of the user who created the post.
  final String userName;

  /// The date and time the post was created.
  final DateTime postDate;

  /// A category or type of work associated with the post (e.g., "part-time", "freelance").
  final String workType;

  /// The title of the post, summarizing its content.
  final String title;

  /// An optional image URL related to the post.
  final String? image;

  /// The detailed content or description of the post.
  final String content;

  /// A list of skills required or associated with the post.
  final List<dynamic> skills;

  /// The textual location of where the service is needed or offered.
  final String location;

  /// The skill level required for the post, e.g., "beginner", "expert".
  final String skillLevel;

  /// The price associated with the service or task.
  final double price;

  /// The geographical latitude of the location.
  final double latitude;

  /// The geographical longitude of the location.
  final double longitude;

  /// Constructs a [PostModel] with the given properties.
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

  /// Returns a list of properties that will be used to determine whether two instances are equal.
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

  /// Determines whether to stringify the [PostModel] object when using `toString`.
  @override
  bool get stringify => true;

  /// Converts the [PostModel] instance into a map of key-value pairs.
  ///
  /// Useful for serialization or sending data over network calls.
  Map<String, dynamic> toMap() {
    return {
      'tymType': tymType,
      'uid': uid,
      'workType': workType,
      'title': title,
      'userName': userName,
      'postDate': postDate.millisecondsSinceEpoch,
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

  /// Creates an instance of [PostModel] from a map of key-value pairs.
  ///
  /// This is particularly useful when constructing a new [PostModel] instance
  /// from data structures that map closely to the underlying storage format (e.g., JSON).
  factory PostModel.fromMap(Map<String, dynamic> map, {required String postId}) {
    return PostModel(
      tymType: map['tymType'] as bool,
      uid: map['uid'] as String,
      workType: map['workType'] as String,
      title: map['title'] as String,
      userName: map['userName'] as String,
      postDate: DateTime.fromMillisecondsSinceEpoch(map['postDate'] as int),
      image: map['image'] != null ? map['image'] as String : null,
      content: map['content'] as String,
      location: map['location'] as String,
      skillLevel: map['skillLevel'] as String,
      price: map['price'] as double,
      skills: map['skills'] as List<dynamic>,
      postId: postId,
      longitude: map['longitude'] as double,
      latitude: map['latitude'] as double,
    );
  }
}
