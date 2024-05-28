import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/route/route_name/app_route_name.dart';

import '../../../auth/presentation/widgets/sign_out/drawer_log_out_widget.dart';
import '../utils/app_policy.dart';
import '../utils/service_center.dart';
import '../utils/share_app.dart';
import '../widgets/widgets/drawer_button.dart';
import '../widgets/widgets/drawer_profile_widget.dart';

class DrawerNavBar extends StatelessWidget {
  const DrawerNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProfileWidget(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                DrawerCustomButton(
                  title: 'Account Info',
                  callback: () {
                    Navigator.pushNamed(context, RouteName.accountInfo);
                  },
                  icon: IconlyLight.profile,
                ),
                DrawerCustomButton(
                  title: 'Notifications',
                  callback: () {
                    'print';
                  },
                  icon: IconlyLight.notification,
                ),
                DrawerCustomButton(
                  title: 'Share the App',
                  callback: () {
                    ShareApp().launchShare();
                  },
                  icon: IconlyLight.send,
                ),
                DrawerCustomButton(
                  title: 'Service Center',
                  callback: () {
                    ServiceCenterUtil().launchEmail();
                  },
                  icon: IconlyLight.calling,
                ),
                DrawerCustomButton(
                  title: 'Privacy Policy',
                  callback: () {
                    AppPolicyUtil().launchPrivacyPolicy();
                  },
                  icon: IconlyLight.document,
                ),
                DrawerCustomButton(
                  title: 'Terms & Condiitions',
                  callback: () {
                    AppPolicyUtil().launchConditions();
                  },
                  icon: IconlyLight.document,
                ),
                const LogOutDrawerButton(),
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
    );
  }
}
