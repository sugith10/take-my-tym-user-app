import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_post_model.dart';
import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/const/app_padding.dart';
import '../../../../core/widgets/app_snackbar/app_snack_bar.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../message/presentation/model/individual_chat_page_arguments.dart';
import '../../../profile/presentation/widget/post_owner_info_widget/post_owner_info_widget.dart';
import '../../../../core/widgets/submit_button.dart';
import '../../../create_post/presentation/widget/post_description_widget.dart';
import '../../../create_post/presentation/widget/post_specifications_widget.dart';
import '../../../create_post/presentation/widget/post_title_widget.dart';
import '../../../create_post/presentation/widget/skills_widget.dart';
import '../../../message/presentation/bloc/individual_message_bloc/individual_message_bloc.dart';
import '../bloc/delete_post_bloc/delete_post_bloc.dart';
import '../bloc/read_post_bloc/read_post_bloc.dart';
import '../widgets/chat_floating_action_button.dart';
import '../widgets/delete_confirmation_dialog.dart';
import '../widgets/post_service_widget.dart';
import '../widgets/proposel_bottom_sheet.dart';
import '../widgets/view_post_app_bar.dart';

class ViewPostPage extends StatefulWidget {
  final PostModel postModel;
  const ViewPostPage({required this.postModel, super.key});

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
          LoadingDialog.show(context);
        }
        if (state is DeletPostFailState) {
          AppSnackBar.failSnackBar(
            context: context,
            alert: state.appAlert,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              ViewPostAppBar(
                update: () {
                  DeleteConfirmationDialog().show(
                    context: context,
                    callBack: () => Navigator.pushNamed(
                      context,
                      RouteName.createPostFirst,
                      arguments: widget.postModel,
                    ),
                  );
                },
                delete: () {
                  _deletePostBloc.add(
                    DeletePersonalPostEvent(
                      postModel: widget.postModel,
                    ),
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
                          PostTitleWidget(title: widget.postModel.title),
                          SizedBox(height: 20.h),
                          UserInfoWidget(
                            name: widget.postModel.userName,
                            date: widget.postModel.postDate,
                            description: "Posted on",
                          ),
                          SizedBox(height: 20.h),
                          PostDescriptionWidget(
                            description: widget.postModel.content,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const HomePadding(child: Divider()),
                    SizedBox(height: 20.h),
                    HomePadding(
                        child: SkillsWidget(
                      skillList: widget.postModel.skills,
                    )),
                    SizedBox(height: 20.h),
                    const HomePadding(child: Divider()),
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
                  Navigator.pushNamed(
                    context,
                    RouteName.message,
                    arguments: IndividualChatPageArguments(
                      currentUid: context.read<AppUserBloc>().userModel!.uid,
                      receiverUid: widget.postModel.uid,
                      receiverName: widget.postModel.userName,
                      individualMessageBloc: IndividualMessageBloc(),
                    ),
                  );
                },
              ),
        bottomNavigationBar: appUser
            ? null
            : Padding(
                padding: const EdgeInsets.all(AppPading.homePadding),
                child: SubmitButton(
                  text: "Submit Proposal",
                  callback: () {
                    ProposelBottomSheet().show(
                      context,
                      postModel: widget.postModel,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
