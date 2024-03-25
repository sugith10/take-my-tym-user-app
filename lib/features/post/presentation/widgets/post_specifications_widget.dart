import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_category_widget.dart';


class PostConstraintsWidget extends StatefulWidget {
  final String location;
  final String level;
  final double amount;
  final bool flexible;

  const PostConstraintsWidget({
    required this.location,
    required this.level,
    required this.amount,
    required this.flexible,
    super.key,
  });

  @override
  State<PostConstraintsWidget> createState() =>
      _PostConstraintsWidgetState();
}

class _PostConstraintsWidgetState extends State<PostConstraintsWidget> {
  late String _flexible;

  @override
  void initState() {
    super.initState();
    widget.flexible ? _flexible = 'Flexible' : _flexible = 'Fixed';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const PostCategoryTitle(title: 'Constraints'),
        SizedBox(height: 15.h),
        _PostSpecificationWidget(
          icon: IconlyLight.location,
          specification: widget.location,
        ),
        SizedBox(height: 15.h),
        _PostSpecificationWidget(
          icon: IconlyLight.work,
          specification: widget.level,
        ),
        SizedBox(height: 15.h),
        _PostSpecificationWidget(
          icon: Icons.currency_rupee_rounded,
          specification: "${widget.amount} ($_flexible)",
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
        Text(specification),
      ],
    );
  }
}
