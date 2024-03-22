import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/image_icon.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/create_page_action_button.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/create_post_text_field.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:take_my_tym/features/create_post/presentation/widgets/work_type_widget.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String dropdownValue = "Remote";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _emojiController = TextEditingController();
  final _scrollController = ScrollController();
  bool _emojiShowing = false;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _emojiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyLight.arrow_left),
        ),
        actions: [
          ActionButton(
            voidCallback: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: MyAppPadding.homePadding,
            left: MyAppPadding.homePadding,
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              const WorkTypeWidget(),
              SizedBox(height: 8.h),
              CreatePostTextField(
                hintText: 'Title',
                textStyle: Theme.of(context).textTheme.displayMedium!,
                controller: _titleController,
              ),
              CreatePostTextField(
                hintText: 'Start typing here...',
                textStyle: Theme.of(context).textTheme.titleLarge!,
                controller: _contentController,
              ),
              Offstage(
                offstage: !_emojiShowing,
                child: EmojiPicker(
                  textEditingController: _emojiController,
                  scrollController: _scrollController,
                  config: Config(
                    height: 256,
                    checkPlatformCompatibility: true,
                    emojiViewConfig: EmojiViewConfig(
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 28 *
                          (foundation.defaultTargetPlatform ==
                                  TargetPlatform.iOS
                              ? 1.2
                              : 1.0),
                    ),
                    swapCategoryAndBottomBar: false,
                    skinToneConfig: const SkinToneConfig(),
                    categoryViewConfig: const CategoryViewConfig(),
                    bottomActionBarConfig: const BottomActionBarConfig(),
                    searchViewConfig: const SearchViewConfig(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                      image: MyAppImages.emojiIcon, width: 30.w, height: 30.w),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                const SwitchCategoryWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
