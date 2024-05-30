part of 'online_bloc_bloc.dart';

sealed class OnlineBlocState extends Equatable {
  const OnlineBlocState();
  
  @override
  List<Object> get props => [];
}

final class OnlineBlocInitial extends OnlineBlocState {}
