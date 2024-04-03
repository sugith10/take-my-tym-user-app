import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/bloc/app_bloc.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/presentation/widgets/chat_floating_action_button.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_description_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_owner_info_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_service_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_specifications_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_title_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/skills_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/submit_button.dart';

class ViewPostPage extends StatelessWidget {
  final PostModel postModel;
  const ViewPostPage({required this.postModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ViewPostAppBar(
              callback: () {},
              showMoreButton:
                  postModel.uid == context.read<AppBloc>().appUserModel!.uid,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  HomePadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        ServiceTypeWidget(type: postModel.workType),
                        SizedBox(height: 15.h),
                        PostTitleWidget(
                          title: postModel.title,
                        ),
                        SizedBox(height: 20.h),
                        PostOwnerInfoWidget(
                          name: postModel.userName,
                          image: MyAppImages.testProfile,
                          date: 'Oct 15,2023',
                        ),
                        SizedBox(height: 20.h),
                        PostDescriptionWidget(
                          description: postModel.content,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Divider(),
                  SizedBox(height: 20.h),
                  HomePadding(
                      child: SkillsWidget(
                    skillList: postModel.category,
                  )),
                  SizedBox(height: 20.h),
                  const Divider(),
                  SizedBox(height: 20.h),
                  HomePadding(
                    child: PostConstraintsWidget(
                      location: postModel.location,
                      level: postModel.skillLevel,
                      amount: postModel.price,
                      flexible: true,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ChatFloatingActionButton(
        callBack: () {},
      ),
      bottomNavigationBar: SubmitButton(
        callback: () {},
      ),
    );
  }
}

class ViewPostAppBar extends StatelessWidget {
  final VoidCallback callback;
  final bool showMoreButton;
  const ViewPostAppBar({
    required this.showMoreButton,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      leading: const BackButtonWidget(),
      actions: [
        showMoreButton
            ? PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                      value: ("Update"),
                      child: PopupMenuItemChildWidget(
                        value: 'Update',
                        icon: IconlyLight.edit,
                      )),
                  const PopupMenuItem(
                    value: ("Delete"),
                    child: PopupMenuItemChildWidget(
                        value: 'Delete', icon: IconlyLight.delete),
                  )
                ],
                onSelected: (value) {
                  log(value);
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class PopupMenuItemChildWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  const PopupMenuItemChildWidget({
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 20),
        Text(
          value,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
