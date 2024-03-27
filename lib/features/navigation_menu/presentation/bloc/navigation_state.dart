part of 'navigation_bloc.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

final class HomeState extends NavigationState {}

final class MessageState extends NavigationState {}

final class MoneyState extends NavigationState {}

final class ProfileState extends NavigationState {}
