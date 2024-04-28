part of 'create_post_bloc.dart';

abstract class CreatePostEvent {
  const CreatePostEvent();
}

final class CreateFirstPageEvent extends CreatePostEvent {
  final AppUserModel userModel;
  final bool tymType;
  final String workType;
  final String title;
  final String content;
  CreateFirstPageEvent({
    required this.userModel,
    required this.tymType,
    required this.workType,
    required this.title,
    required this.content,
  });
}

final class CreateSecondPageEvent extends CreatePostEvent {
  final List<String> skills;
  final String location;
  final String experience;
  final String remuneration;
  final double latitude;
  final double longitude;

  CreateSecondPageEvent({
    required this.experience,
    required this.location,
    required this.remuneration,
    required this.skills,
    required this.latitude,
    required this.longitude,
  });
}
