import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/right_to_left.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_post_model.dart';
import '../../../../core/utils/app_assets/test/app_test_assets.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../../core/widgets/post_owner_info_widget.dart';
import '../../../../core/widgets/submit_button.dart';
import '../../../create_post/presentation/pages/create_post_first_page.dart';
import '../../../create_post/presentation/widgets/post_description_widget.dart';
import '../../../create_post/presentation/widgets/post_specifications_widget.dart';
import '../../../create_post/presentation/widgets/post_title_widget.dart';
import '../../../create_post/presentation/widgets/skills_widget.dart';
import '../../../message/presentation/bloc/individual_message_bloc/individual_message_bloc.dart';
import '../../../message/presentation/pages/individual_chat_page.dart';
import '../bloc/delete_post_bloc/delete_post_bloc.dart';
import '../bloc/read_post_bloc/read_post_bloc.dart';
import '../widgets/chat_floating_action_button.dart';
import '../widgets/post_service_widget.dart';
import '../widgets/proposel_bottom_sheet.dart';
import '../widgets/view_post_app_bar.dart';

class ViewPostPage extends StatefulWidget {
  final PostModel postModel;
  const ViewPostPage({required this.postModel, super.key});

  static route({required PostModel postModel}) =>
      rightToLeft(ViewPostPage(postModel: postModel));

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  final DeletePostBloc _deletePostBloc = DeletePostBloc();

  late final bool appUser;
  @override
  void initState() {
    super.initState();
    appUser =
        widget.postModel.uid == context.read<AppUserBloc>().userModel?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _deletePostBloc,
      listener: (context, state) {
        if (state is DeletPostSuccessState) {
          state.refreshType
              ? context.read<GetPostsBloc>().add(
                    GetBuyTymPostsEvent(userId: state.uid),
                  )
              : context.read<GetPostsBloc>().add(
                    GetSellTymPostsEvent(userId: state.uid),
                  );
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        if (state is DeletePostLoading) {
          LoadingDialog().show(context);
        }
        if (state is DeletPostFailState) {
          AppSnackBar.failSnackBar(context: context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              ViewPostAppBar(
                update: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreatePostFirstPage(
                        postModel: widget.postModel,
                      ),
                    ),
                  );
                },
                delete: () {
                  AppDialog.show(
                    context: context,
                    title: 'Delete confirmation',
                    subtitle: 'Are you sure you want delete this post?',
                    action: 'Delete',
                    actionCall: () {
                      _deletePostBloc.add(
                        DeletePersonalPostEvent(
                          postModel: widget.postModel,
                        ),
                      );
                    },
                  );
                },
                showMoreButton: widget.postModel.uid ==
                    context.read<AppUserBloc>().userModel!.uid,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HomePadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          ServiceTypeWidget(type: widget.postModel.workType),
                          SizedBox(height: 15.h),
                          PostTitleWidget(
                            title: widget.postModel.title,
                          ),
                          SizedBox(height: 20.h),
                          PostOwnerInfoWidget(
                            name: widget.postModel.userName,
                            image: MyAppImages.testProfile,
                            date: widget.postModel.postDate,
                          ),
                          SizedBox(height: 20.h),
                          PostDescriptionWidget(
                            description: widget.postModel.content,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const Divider(),
                    SizedBox(height: 20.h),
                    HomePadding(
                        child: SkillsWidget(
                      skillList: widget.postModel.skills,
                    )),
                    SizedBox(height: 20.h),
                    const Divider(),
                    SizedBox(height: 20.h),
                    HomePadding(
                      child: PostConstraintsWidget(
                        location: widget.postModel.location,
                        level: widget.postModel.skillLevel,
                        amount: widget.postModel.price,
                        showTitle: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: appUser
            ? null
            : ChatFloatingActionButton(
                callBack: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => IndividualChatPage(
                        currentUid: context.read<AppUserBloc>().userModel!.uid,
                        receiverUid: widget.postModel.uid,
                        receiverName: widget.postModel.userName,
                        individualMessageBloc: IndividualMessageBloc(),
                      ),
                    ),
                  );
                },
              ),
        bottomNavigationBar: appUser
            ? null
            : SubmitButton(
                text: "Submit Proposel",
                callback: () {
                  ProposelBottomSheet().show(
                    context,
                    postModel: widget.postModel,
                  );
                },
              ),
      ),
    );
  }
}
