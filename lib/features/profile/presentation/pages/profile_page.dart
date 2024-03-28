import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/app_bar_title.dart';
import 'package:take_my_tym/core/widgets/settings_button.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/about_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/my_posts.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_card_widget/profile_card_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_options_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            title: const AppBarTitle(title: 'My Tym'),
            actions: [SettingsButton(callback: () {})],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              
              [
             const ProfileCard(),
              const AboutWidget(),
              SizedBox(
                height: 20.h,
              ),
              const ProfileOptionsWidget(),
              SizedBox(
                height: 20.h,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: MyAppPadding.homePadding,
                  right: MyAppPadding.homePadding,
                ),
                child: SwitchCategoryWidget(),
              ),
              const SizedBox(
                height: 20,
              ),
              const MyPosts()
            ]),
          ),
        ],
      ),
    );
  }
}

