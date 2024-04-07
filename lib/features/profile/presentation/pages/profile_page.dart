import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/default_silver_appbar.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/profile_posts/switch_profile_posts_widget.dart';
import 'package:take_my_tym/features/profile/presentation/pages/edit_profile.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/about_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_card_widget/profile_card_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_options_widget.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/profile_posts/profile_posts_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DefaultSilverAppBar(
            title: 'My Tym',
            settings: () {},
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ProfileCard(),
                const AboutWidget(),
                SizedBox(
                  height: 20.h,
                ),
                ProfileOptionsWidget(
                  editProfile: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditProfilePage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                const SwitchProfilePostsWidget(),
                const SizedBox(
                  height: 25,
                ),
                const ProfilePostsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
