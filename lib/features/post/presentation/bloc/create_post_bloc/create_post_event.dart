part of 'create_post_bloc.dart';

abstract class CreatePostEvent {
  const CreatePostEvent();
}

final class CollectFirstPageDataEvent extends CreatePostEvent {
  final String uid;
  final String userName;
  final bool postType;
  final String workType;
  final String title;
  final String content;
   CollectFirstPageDataEvent({
    required this.uid,
    required this.userName,
    required this.postType,
    required this.workType,
    required this.title,
    required this.content,
  });

}

final class CollectSecondPageDataEvent extends CreatePostEvent{

}