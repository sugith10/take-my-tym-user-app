import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer_button.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/profile_widget.dart';

class DrawerNavBar extends StatelessWidget {
  const DrawerNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ProfileWidget(
              name: 'Sugith',
              email: 'sugithkodappurath@gmail.com',
              picture: MyAppImages.testProfile,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  DrawerCustomButton(
                    title: 'Profile',
                    function: () {},
                    icon: IconlyLight.profile,
                  ),
                  DrawerCustomButton(
                    title: 'Notifications',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.notification,
                  ),
                  DrawerCustomButton(
                    title: 'Your Orders',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.buy,
                  ),
                  DrawerCustomButton(
                    title: 'Login Settings',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.password,
                  ),
                  DrawerCustomButton(
                    title: 'Share the App',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.send,
                  ),
                  DrawerCustomButton(
                    title: 'Service Center',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.calling,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                '© 2024 DayProduction® v1.0.0',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
