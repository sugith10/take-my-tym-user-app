part of 'delete_post_bloc.dart';

sealed class DeletePostEvent extends Equatable {
  const DeletePostEvent();

  @override
  List<Object> get props => [];
}

final class DeletePersonalPostEvent extends DeletePostEvent {
  final PostModel postModel;
  const DeletePersonalPostEvent({required this.postModel});
}
