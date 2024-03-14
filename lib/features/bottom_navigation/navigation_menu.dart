import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/create_post/presentation/pages/create_post.dart';
import 'package:take_my_tym/features/home/presentation/pages/home_page.dart';
import 'package:take_my_tym/features/message/presentation/pages/messages_page.dart';
import 'package:take_my_tym/features/money/presentation/pages/money_page.dart';
import 'package:take_my_tym/features/profile/presentation/pages/profile_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int index = 0;
  final screens = [
    const HomePage(user: AuthUserModel(email: 'shsh')),
    const MessagePage(),
    const CreatePostPage(),
    const MoneyPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: screens[index]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index = value;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(index == 0 ? IconlyBold.home : IconlyLight.home),
                label: 'Home'),
            NavigationDestination(
              icon: Icon(
                index == 1 ? IconlyBold.message : IconlyLight.message,
              ),
              label: 'Message',
            ),
            NavigationDestination(
              icon: Icon(
                index == 2
                    ? Icons.add_circle_rounded
                    : Icons.add_circle_outline_rounded,
              ),
              label: 'Create',
            ),
            NavigationDestination(
                icon: Icon(
                  index == 3 ? IconlyBold.wallet : IconlyLight.wallet,
                ),
                label: 'Money'),
            NavigationDestination(
                icon: Icon(
                  index == 4 ? IconlyBold.profile : IconlyLight.profile,
                ),
                label: 'Profile'),
          ],
        ));
  }
}
