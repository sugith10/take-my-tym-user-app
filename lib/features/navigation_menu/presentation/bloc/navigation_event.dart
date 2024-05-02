part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

final class NavigationHomeEvent extends NavigationEvent{}

final class MessagePageNavigation extends NavigationEvent{}

final class MoneyPageNavigation extends NavigationEvent{}

final class ProfilePageNavigation extends NavigationEvent{}