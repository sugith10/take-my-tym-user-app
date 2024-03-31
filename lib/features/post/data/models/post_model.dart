// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String uid;
  final String userName;
  final DateTime postDate;
  final String workType;
  final String title;
  final String? image;
  final String content;
  final List<String> category = [];
  final String location;
  final String skillLevel;
  final double price;

  PostModel({
    required this.uid,
    required this.workType,
    required this.title,
    required this.content,
    required this.userName,
    required this.postDate,
    required this.location,
    this.image,
    required this.skillLevel,
    required this.price,
  });

  @override
  List<Object> get props {
    return [
      uid,
      userName,
      postDate,
      content,
      location,
      skillLevel,
      price,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
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
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
