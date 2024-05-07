import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';

class PanelTitleWidget extends StatelessWidget {
  final String title;
  const PanelTitleWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthPadding(
      child: Column(
        children: [
          const SizedBox(height: 25),
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
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
