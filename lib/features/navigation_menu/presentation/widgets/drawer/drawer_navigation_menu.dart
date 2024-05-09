import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_assets/test/app_test_assets.dart';
import '../../../../auth/presentation/pages/account_info_page.dart';
import '../../../../auth/presentation/widgets/sign_out/drawer_log_out_button.dart';
import 'widgets/drawer_button.dart';
import 'widgets/drawer_profile_widget.dart';

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
                        AccountInfoPage.route(),
                      );
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
                    title: 'Share the App',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.send,
                  ),
                  DrawerCustomButton(
                    title: 'Service Center',
                    function: () {
                      _makePhoneCall();
                    },
                    icon: IconlyLight.calling,
                  ),
                  DrawerCustomButton(
                    title: 'Privacy Policy',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.document,
                  ),
                  DrawerCustomButton(
                    title: 'Terms & Condiitions',
                    function: () {
                      'print';
                    },
                    icon: IconlyLight.document,
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

void _makePhoneCall() async {
  final Uri uri = Uri(scheme: 'tel', path: "7907603014");
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    throw 'Could not launch $uri';
  }
}
