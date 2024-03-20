part of 'navigation_cubit.dart';

final class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState({
    required this.index,
    required this.navbarItem,
  });

  @override
  List<Object> get props => [navbarItem, index];
}
