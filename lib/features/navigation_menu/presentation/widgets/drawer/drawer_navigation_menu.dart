import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/features/auth/presentation/pages/account_info_page.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer/widgets/drawer_button.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer/widgets/drawer_profile_widget.dart';

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
              picture: MyAppImages.testProfile,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  DrawerCustomButton(
                    title: 'Account Info',
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AccountInfoPage()));
                    },
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
                  DrawerCustomButton(
                    title: 'Log Out',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.logout,
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
