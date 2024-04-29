import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/utils/app_responsive.dart';
import 'package:take_my_tym/core/widgets/app_card.dart';

class PostedContentWidget extends StatelessWidget {
  final String? image;
  final PostModel postModel;
  final double width;
  final VoidCallback voidCallback;
  final double? height;

  const PostedContentWidget({
    this.image,
    required this.voidCallback,
    required this.postModel,
    required this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      voidCallback: voidCallback,
      width: width,
      height: height,
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
                    height: height,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Service Type: ${postModel.workType}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.bottomLeft,
            child: _TitleText(title: postModel.title),
          ),
          if (image == null)
            Column(
              children: [
                SizedBox(height: 15.h),
                _ContentText(content: postModel.content),
              ],
            ),
          SizedBox(height: 10.h),
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

class _ContentText extends StatelessWidget {
  final String content;
  const _ContentText({
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    if (MobileResponsive.mobileMedium(context)) {
      return Text(
        content,
        style: Theme.of(context).textTheme.labelLarge,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    }
    return Text(
      content,
      style: Theme.of(context).textTheme.bodyLarge,
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
    );
  }
}
