import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer_button.dart';

class DrawerNavBar extends StatelessWidget {
  const DrawerNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: SizedBox(
              child: Row(
                children: [
                const  CircleProfilePicture(height: 80,width: 80,image:  MyAppImages.testProfile,),
                  const SizedBox(width: 10),
                  Column(
                    children: [],
                  )
                ],
              ),
            ),
          ),
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
            title: 'Service Center',
            function: () {
              'print';
            },
            icon: IconlyLight.calling,
          ),
        ],
      ),
    ));
  }
}

