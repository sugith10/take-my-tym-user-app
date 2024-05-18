import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../features/create_post/presentation/widgets/post_specifications_widget.dart';
import '../bloc/app_user_bloc/app_user_bloc.dart';
import '../model/app_post_model.dart';
import '../utils/theme/app_colors.dart';
import '../utils/app_radius.dart';
import '../utils/app_responsive.dart';
import '../utils/name_capitalize.dart';
import 'app_card.dart';

class PostedContentWidget extends StatelessWidget {
  final String? image;
  final PostModel postModel;
  final double width;
  final VoidCallback voidCallback;

  const PostedContentWidget({
    this.image,
    required this.voidCallback,
    required this.postModel,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          AppCard(
            voidCallback: voidCallback,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Posted on: ${TextManipulator.timestampToDate(postModel.postDate)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 10.h),
                _TitleText(title: postModel.title),
                if (image == null)
                  Column(
                    children: [
                      SizedBox(height: 15.h),
                      _Content(content: postModel.content),
                    ],
                  ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppDarkColor.instance.secondaryBorder,
                ),
                SizedBox(height: 10.h),
                PostConstraintsWidget(
                  location: postModel.location,
                  level: postModel.skillLevel,
                  amount: postModel.price,
                  showTitle: false,
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          if (context.read<AppUserBloc>().userModel!.uid != postModel.uid)
            Positioned(
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppDarkColor.instance.lightBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(MyAppRadius.borderRadius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    IconlyLight.bookmark,
                    color: AppDarkColor.instance.iconColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  final String title;
  const _TitleText({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (MobileResponsive.mobileMedium(context)) {
      return Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    }
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _Content extends StatelessWidget {
  final String content;
  const _Content({
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 35.h, maxHeight: 35.h),
      child: Text(
        content,
        style: Theme.of(context).textTheme.bodyLarge,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
