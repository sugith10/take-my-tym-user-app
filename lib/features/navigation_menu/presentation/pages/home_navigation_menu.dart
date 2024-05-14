import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/navigation/screen_transitions/no_movement.dart';
import '../../../create_post/presentation/pages/create_post_first_page.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../message/presentation/pages/chat_list_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import 'work_tab_bar_menu.dart';
import '../bloc/navigation_bloc.dart';
import 'drawer_navigation_menu.dart';

class HomeNavigationMenu extends StatefulWidget {
  static route() => noMovement(const HomeNavigationMenu());
  const HomeNavigationMenu({super.key});

  @override
  State<HomeNavigationMenu> createState() => _HomeNavigationMenuState();
}

class _HomeNavigationMenuState extends State<HomeNavigationMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool pop = false;

  final _screen = [
    const HomePage(),
    const ChatListPage(),
    const CreatePostFirstPage(),
    const WorkTabBar(),
    const ProfilePage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserBloc, AppState>(
      builder: (context, state) {
        if (state is UserModelUpdatedState) {
          return BlocProvider(
            create: (context) => NavigationBloc(),
            child: Scaffold(
              key: _scaffoldKey,
              drawer: const DrawerNavBar(),
              body: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
                  switch (state) {
                    case HomeState():
                      return SafeArea(child: _screen[0]);
                    case MessageState():
                      return SafeArea(child: _screen[1]);
                    case MoneyState():
                      return SafeArea(child: _screen[3]);
                    case ProfileState():
                      return SafeArea(child: _screen[4]);
                  }
                },
              ),
              bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
                  builder: (context, state) {
                return NavigationBar(
                  selectedIndex: _index,
                  onDestinationSelected: (value) {
                    final navigationBloc =
                        BlocProvider.of<NavigationBloc>(context);
                    switch (value) {
                      case 0:
                        _index = value;
                        navigationBloc.add(NavigationHomeEvent());
                        break;
                      case 1:
                        _index = value;
                        navigationBloc.add(MessagePageNavigation());
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          CreatePostFirstPage.route(),
                        );
                        break;
                      case 3:
                        _index = value;
                        navigationBloc.add(MoneyPageNavigation());
                        break;
                      case 4:
                        _index = value;
                        navigationBloc.add(ProfilePageNavigation());
                        break;
                    }
                  },
                  destinations: [
                    NavigationDestination(
                      icon: Icon(
                          _index == 0 ? IconlyBold.home : IconlyLight.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(
                        _index == 1 ? IconlyBold.message : IconlyLight.message,
                      ),
                      label: 'Message',
                    ),
                    NavigationDestination(
                      icon: Icon(
                        _index == 2 ? IconlyBold.plus : IconlyLight.plus,
                      ),
                      label: 'Create',
                    ),
                    NavigationDestination(
                      icon: Icon(
                        _index == 3 ? IconlyBold.work : IconlyLight.work,
                      ),
                      label: 'Work',
                    ),
                    NavigationDestination(
                      icon: Icon(
                        _index == 4 ? IconlyBold.profile : IconlyLight.profile,
                      ),
                      label: 'Profile',
                    ),
                  ],
                );
              }),
            ),
          );
        }
        return const Scaffold(
          body: SizedBox(),
        );
      },
    );
  }
}
