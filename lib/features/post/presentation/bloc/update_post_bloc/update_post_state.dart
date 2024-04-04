part of 'update_post_bloc.dart';

sealed class UpdatePostState extends Equatable {
  const UpdatePostState();
  
  @override
  List<Object> get props => [];
}

final class UpdatePostInitial extends UpdatePostState {}
