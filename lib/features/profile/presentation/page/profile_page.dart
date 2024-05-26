import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';

import '../../../../core/model/app_user_model.dart';
import '../../../../core/widgets/default_silver_appbar.dart';
import '../../../proposal/presentation/bloc/get_offer_bloc/get_proposal_bloc.dart';
import '../widget/about_widget.dart';
import '../widget/profile_card_widget/profile_card_widget.dart';
import '../widget/profile_options_widget.dart';
import '../widget/profile_posts_widget.dart';
import 'edit_profile.dart';

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
    return BlocProvider(
      create: (context) => GetProposalBloc()
        ..add(
          ProposalGetEvent(uid: context.read<AppUserBloc>().userModel!.uid),
        ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            DefaultSilverAppBar(title: 'My Tym', settings: () {}),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProfileCard(userModel: _userModel),
                  AboutWidget(about: _userModel.about!),
                  ProfileOptionsWidget(
                    editProfile: () {
                      Navigator.push(context, EditProfilePage.route());
                    },
                  ),
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
