part of 'update_post_bloc.dart';

sealed class UpdatePostEvent {
  const UpdatePostEvent();
}

final class UpdateFirstPageEvent extends UpdatePostEvent {
  final PostModel postModel;

  final String workType;
  final String title;
  final String content;
  const UpdateFirstPageEvent({
    required this.postModel,
    required this.workType,
    required this.title,
    required this.content,
  });
}

final class UpdateSecondPageEvent extends UpdatePostEvent {
  final List<String> skills;
  final String location;
  final String experience;
  final String remuneration;

  UpdateSecondPageEvent({
    required this.experience,
    required this.location,
    required this.remuneration,
    required this.skills,
  });
}
