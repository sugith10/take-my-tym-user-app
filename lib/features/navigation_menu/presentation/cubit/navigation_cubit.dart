import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/utils/nav_bar_item.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(navbarItem: NavbarItem.home, index: 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(
          const NavigationState(
            index: 0,
            navbarItem: NavbarItem.home,
          ),
        );
        break;
      case NavbarItem.message:
        emit(
          const NavigationState(
            index: 1,
            navbarItem: NavbarItem.message,
          ),
        );
        break;
      case NavbarItem.create:
        emit(
          const NavigationState(
            index: 2,
            navbarItem: NavbarItem.create,
          ),
        );
        break;
      case NavbarItem.money:
        emit(
          const NavigationState(
            index: 3,
            navbarItem: NavbarItem.money,
          ),
        );
        break;
      case NavbarItem.profile:
        emit(
          const NavigationState(
            index: 4,
            navbarItem: NavbarItem.profile,
          ),
        );
        break;
    }
  }
}
