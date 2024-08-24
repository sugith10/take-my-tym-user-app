import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import 'post_category_widget.dart';

class PostConstraintsWidget extends StatelessWidget {
  final bool showTitle;
  final String location;
  final String level;
  final double amount;

  const PostConstraintsWidget({
    required this.showTitle,
    required this.location,
    required this.level,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Column(
            children: [
              const PostCategoryTitle(title: 'Relevant Details'),
              SizedBox(height: 15.h),
            ],
          ),
        _PostSpecificationWidget(
          icon: IconlyLight.location,
          specification: location,
        ),
        SizedBox(height: 15.h),
        _PostSpecificationWidget(
          icon: IconlyLight.work,
          specification: level,
        ),
        SizedBox(height: 15.h),
        _PostSpecificationWidget(
          icon: Icons.currency_rupee_rounded,
          specification: "$amount",
        )
      ],
    );
  }
}

class _PostSpecificationWidget extends StatelessWidget {
  final IconData icon;
  final String specification;
  const _PostSpecificationWidget({
    required this.icon,
    required this.specification,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            specification,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
