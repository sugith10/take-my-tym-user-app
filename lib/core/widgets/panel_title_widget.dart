import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

import '../utils/theme/color/app_colors.dart';

class PanelTitleWidget extends StatelessWidget {
  final String title;

  final bool padding;
  const PanelTitleWidget({
    required this.title,
    this.padding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding ? MyAppPadding.authPadding : 0),
      child: Column(
        children: [
          SizedBox(height: padding ? 25 : 20),
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                width: 5.w,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyLight.info_circle,
                  color: AppDarkColor.instance.gradientPrimary,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: AppDarkColor.instance.softBackground,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
