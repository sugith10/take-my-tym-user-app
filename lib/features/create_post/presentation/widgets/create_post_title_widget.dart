import 'package:flutter/material.dart';

import '../../../../core/widgets/app_title_box_widget.dart';


class CreatePostTitleWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CreatePostTitleWidget({
    required this.children,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTitleBoxWidget(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}