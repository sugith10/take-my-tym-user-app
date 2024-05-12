import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/utils/app_responsive.dart';
import 'package:take_my_tym/core/widgets/app_card.dart';

import '../../features/create_post/presentation/widgets/post_specifications_widget.dart';

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
      child: AppCard(
        voidCallback: voidCallback,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      MyAppRadius.borderRadius,
                    ),
                    child: Image.asset(
                      image!,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            Text(
              'Service Type: ${postModel.workType}',
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
