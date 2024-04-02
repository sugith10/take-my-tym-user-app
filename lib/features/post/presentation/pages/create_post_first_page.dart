import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/post_types.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/image_icon.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/pages/create_post_second_page.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_text_field.dart';
import 'package:take_my_tym/features/post/presentation/widgets/work_type_widget.dart';

class CreatePostFirstPage extends StatefulWidget {
  const CreatePostFirstPage({super.key});

  @override
  State<CreatePostFirstPage> createState() => _CreatePostFirstPageState();
}

class _CreatePostFirstPageState extends State<CreatePostFirstPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _emojiController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _emojiController.dispose();
    super.dispose();
  }

  bool postType = true;
  void getCategory(bool select) {
    postType = select;
    log("select $select, postType $postType");
  }

  String workType = MyAppPostType.remote;
  void getWorkType(String select) {
    workType = select;
    log("select $select workType $workType");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is FirstDataCollectFailState) {
          SnackBarMessenger().showSnackBar(
            context: context,
            errorMessage: state.message,
            errorDescription: state.description,
          );
        }
        if(state is FirstDataCollectSuccessState){
             Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const CreatePostSecondPage()),
                );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButtonWidget(),
          actions: [
            ActionButton(
              voidCallback: () {
              log('next');
                context.read<CreatePostBloc>().add(
                      CollectFirstPageDataEvent(
                        uid: '123456789',
                        userName: 'sugith',
                        postType: postType,
                        title: _titleController.text.trim(),
                        content: _contentController.text.trim(),
                        workType: workType,
                      ),
                    );
              },
              action: 'Next',
            ),
          ],
        ),
        body: HomePadding(
            child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  WorkTypeWidget(function: getWorkType),
                  SizedBox(height: 8.h),
                  CreatePostTextField(
                    hintText: 'Title',
                    textStyle: Theme.of(context).textTheme.displayMedium!,
                    controller: _titleController,
                    expands: false,
                  ),
                  Expanded(
                    child: CreatePostTextField(
                      hintText: 'Start typing here...',
                      textStyle: Theme.of(context).textTheme.titleLarge!,
                      controller: _contentController,
                      expands: true,
                    ),
                  ),
                  // Offstage(
                  //   offstage: !_emojiShowing,
                  //   child: EmojiPicker(
                  //     textEditingController: _emojiController,
                  //     scrollController: _scrollController,
                  //     config: Config(
                  //       height: 256,
                  //       checkPlatformCompatibility: true,
                  //       emojiViewConfig: EmojiViewConfig(
                  //         // Issue: https://github.com/flutter/flutter/issues/28894
                  //         emojiSizeMax: 28 *
                  //             (foundation.defaultTargetPlatform ==
                  //                     TargetPlatform.iOS
                  //                 ? 1.2
                  //                 : 1.0),
                  //       ),
                  //       swapCategoryAndBottomBar: false,
                  //       skinToneConfig: const SkinToneConfig(),
                  //       categoryViewConfig: const CategoryViewConfig(),
                  //       bottomActionBarConfig: const BottomActionBarConfig(),
                  //       searchViewConfig: const SearchViewConfig(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 50.h,
            color: MyAppDarkColor().bottomNavigationBarBackground,
            child: Padding(
              padding: const EdgeInsets.only(
                left: MyAppPadding.homePadding,
                right: MyAppPadding.homePadding,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: CoustomImageIcon(
                        image: MyAppImages.galleryIcon,
                        width: 30.w,
                        height: 30.w),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      // onTapEmojiField();
                    },
                    icon: CoustomImageIcon(
                        image: MyAppImages.emojiIcon,
                        width: 30.w,
                        height: 30.w),
                  ),
                  const SizedBox(width: 10),
                  const Spacer(),
                  SwitchCategoryWidget(
                    getCategory: getCategory,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
