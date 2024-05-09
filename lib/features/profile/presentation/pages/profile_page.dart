import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/default_silver_appbar.dart';
import '../../../create_post/presentation/widgets/profile_posts/switch_profile_posts_widget.dart';
import '../widgets/about_widget.dart';
import '../widgets/profile_card_widget/profile_card_widget.dart';
import '../widgets/profile_options_widget.dart';
import '../widgets/profile_posts_widget.dart';
import 'edit_profile.dart';

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
                SizedBox(height: 20.h),
                ProfileOptionsWidget(
                  editProfile: () {
                    Navigator.push(context, EditProfilePage.route());
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
