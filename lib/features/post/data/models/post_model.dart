// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final bool tymType; /// true == buyTym : falase == sellTym
  final String uid;
  final String? postId; 
  final String userName;
  final DateTime postDate;
  final String workType;
  final String title;
  final String? image;
  final String content;
  final List<dynamic> skills;
  final String location;
  final String skillLevel;
  final double price;

  const PostModel({
    required this.tymType,
    required this.uid,
    this.postId,
    required this.workType,
    required this.title,
    required this.content,
    required this.userName,
    required this.postDate,
    required this.location,
    this.image,
    required this.skillLevel,
    required this.price,
    required this.skills,
  });

  @override
  List<Object> get props {
    return [
      uid,
     tymType,
      userName,
      postDate,
      content,
      location,
      skillLevel,
      price,
      skills,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tymType':tymType,
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
    };
  }

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
    );
  }

  // String toJson() => json.encode(toMap());

  // factory PostModel.fromJson(String source) =>
  //     PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
