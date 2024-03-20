import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/create_post/presentation/pages/create_post.dart';
import 'package:take_my_tym/features/home/presentation/pages/home_page.dart';
import 'package:take_my_tym/features/message/presentation/pages/messages_page.dart';
import 'package:take_my_tym/features/money/presentation/pages/money_page.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/cubit/navigation_cubit.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/utils/nav_bar_item.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer_navigation_menu.dart';
import 'package:take_my_tym/features/profile/presentation/pages/profile_page.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final screen = [
    const HomePage(),
    const MessagePage(),
    const CreatePostPage(),
    const MoneyPage(),
    const ProfilePage()
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    log('build');
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerNavBar(),
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.home) {
              return SafeArea(child: screen[0]);
            } else if (state.navbarItem == NavbarItem.message) {
              return SafeArea(child: screen[1]);
            } else if (state.navbarItem == NavbarItem.money) {
              return SafeArea(child: screen[3]);
            } else if (state.navbarItem == NavbarItem.profile) {
              return SafeArea(child: screen[4]);
            }
            return const SizedBox();
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          return NavigationBar(
            selectedIndex: state.index,
            onDestinationSelected: (value) {
              if (value == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePostPage()));
              }
              if (value == 0) {
                _index = value;
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (value == 1) {
                _index = value;
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.message);
              } else if (value == 2) {
                _index = value;
                // BlocProvider.of<NavigationCubit>(context)
                //     .getNavBarItem(NavbarItem.create);
              } else if (value == 3) {
                _index = value;
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.money);
              } else if (value == 4) {
                _index = value;
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.profile);
              }
            },
            destinations: [
              NavigationDestination(
                icon: Icon(_index == 0 ? IconlyBold.home : IconlyLight.home),
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
                  _index == 2
                      ? Icons.add_circle_rounded
                      : Icons.add_circle_outline_rounded,
                ),
                label: 'Create',
              ),
              NavigationDestination(
                  icon: Icon(
                    _index == 3 ? IconlyBold.wallet : IconlyLight.wallet,
                  ),
                  label: 'Money'),
              NavigationDestination(
                  icon: Icon(
                    _index == 4 ? IconlyBold.profile : IconlyLight.profile,
                  ),
                  label: 'Profile'),
            ],
          );
        }),
      ),
    );
  }
}
