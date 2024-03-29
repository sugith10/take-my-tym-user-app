part of 'create_post_bloc.dart';

abstract class CreatePostState extends Equatable {
  const CreatePostState();  

  @override
  List<Object> get props => [];
}
class CreatePostInitial extends CreatePostState {}

class ChangeServiceTypeState extends CreatePostState {
  final bool change ;
  const ChangeServiceTypeState({required this.change});
}
