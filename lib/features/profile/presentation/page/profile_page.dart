import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/widgets/default_silver_appbar.dart';
import '../../../../core/widgets/home_padding.dart';
import '../widget/about_widget.dart';
import '../widget/profile_card_widget/profile_card_widget.dart';
import '../widget/profile_posts_widget.dart';

class ProfilePage extends StatefulWidget {
  final UserModel? userModel;
  const ProfilePage({
    this.userModel,
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserModel _userModel;
  @override
  void initState() {
    super.initState();
    if (widget.userModel == null) {
      _userModel = context.read<AppUserBloc>().userModel!;
    } else {
      _userModel = widget.userModel!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            DefaultSilverAppBar(title: 'My Tym', settings: () {}),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 20.h),
                  ProfileCard(userModel: _userModel),
                  SizedBox(height: 20.h),
                  AboutWidget(about: _userModel.about!),
                  SizedBox(height: 15.h),
                  // ProfileOptionsWidget(
                  //   editProfile: () {
                  //     Navigator.pushNamed(context, RouteName.editProfile);
                  //   },
                  // ),
                  SizedBox(height: 15.h),
                  const HomePadding(child: Divider()),
                  const SizedBox(height: 25),
                  // const SwitchProfilePostsWidget(),
                  // const SizedBox(height: 30),
                  const ProfilePostsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
