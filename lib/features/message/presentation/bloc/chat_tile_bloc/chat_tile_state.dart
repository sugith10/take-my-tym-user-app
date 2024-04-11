part of 'chat_tile_bloc.dart';

sealed class ChatTileState extends Equatable {
  const ChatTileState();
  
  @override
  List<Object> get props => [];
}

final class ChatTileInitial extends ChatTileState {}
