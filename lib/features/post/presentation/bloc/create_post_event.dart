part of 'create_post_bloc.dart';

abstract class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

final class ChangeServiceTypeEvent extends CreatePostEvent {
  final bool change;
  const ChangeServiceTypeEvent({required this.change});
}

final class StoreFirstPageData extends CreatePostEvent {
  final String userId;
  final bool tymType;
  final bool serviceType;
  final DateTime date;
  final String title;
  final String content;
  final String? image;
  const StoreFirstPageData({
    required this.userId,
    required this.tymType,
    required this.date,
    required this.serviceType,
    required this.image,
    required this.title,
    required this.content,
  });
}


