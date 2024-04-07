import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/features/auth/presentation/pages/account_info_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_out/log_out_drawer_button.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer/widgets/drawer_button.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer/widgets/drawer_profile_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    title: 'Your Orders',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.buy,
                  ),
                  DrawerCustomButton(
                    title: 'Notifications',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.notification,
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
                      _makePhoneCall('7907603014');
                    },
                    icon: IconlyLight.calling,
                  ),

                  const LogOutDrawerButton(), // Logout button for user convenience.

                  /// For user convenience, a logout option is provided in the app drawer.
                  /// This widget serves as the logout button.
                  ///
                  /// Although this widget is logically associated with authentication,
                  /// it's physically located within the Auth module for modular organization.
                  /// Located in features/auth/presentation/widgets/log_out_drawer_button.dart.
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

void _makePhoneCall(String phoneNumber) async {
  final Uri uri = Uri(scheme: 'tel', path: "7907603014");
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    throw 'Could not launch $uri';
  }
}
