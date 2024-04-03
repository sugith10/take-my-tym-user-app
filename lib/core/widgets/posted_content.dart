import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class PostedContentWidget extends StatelessWidget {
  final String? image;
  final String service;
  final String title;
  final String subtitle;
  final double width;
  final VoidCallback voidCallback;

  const PostedContentWidget({
    this.image,
    required this.voidCallback,
    required this.service,
    required this.title,
    required this.subtitle,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        voidCallback();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: MyAppPadding.homePadding,
    
        ),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: MyAppDarkColor().secondaryBackground,
            borderRadius: BorderRadius.circular(
              MyAppRadius.borderRadius,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              MyAppRadius.borderRadius,
            ),
            child: Column(
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
                          height: 120.h,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Service Type: $service',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (image == null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
