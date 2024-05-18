import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/model/app_post_model.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/widgets/switch_category_widget.dart';

class CreatePostBottomBar extends StatelessWidget {
  final PostModel? postModel;
  final bool tymType;
  final Function(bool) getTymType;
  final VoidCallback pickImage;
  const CreatePostBottomBar({
    required this.postModel,
    required this.tymType,
    required this.getTymType,
    required this.pickImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 50.h,
        color: AppDarkColor.instance.bottomBar,
        child: Padding(
          padding: const EdgeInsets.only(
            left: MyAppPadding.homePadding,
            right: MyAppPadding.homePadding,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  pickImage();
                },
                icon: Icon(
                  IconlyBold.image_2,
                  size: 30.w,
                ),
              ),
              const SizedBox(width: 5),
              const SizedBox(width: 10),
              const Spacer(),
              postModel == null
                  ? SwitchCategoryWidget(
                      getTymType: getTymType,
                      tymType: tymType,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
