import 'package:flutter/material.dart';

import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/app_responsive.dart';

class CategoryTitleWidget extends StatelessWidget {
  final String title;
  const CategoryTitleWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: MyAppPadding.homePadding,
        right: MyAppPadding.homePadding,
      ),
      child: Row(
        children: [
          _Text(title: title),
          const SizedBox(width: 10),
          const Expanded(
            child: Divider(
              color: Color.fromRGBO(255, 255, 255, 0.963),
            ),
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    if (MobileResponsive.mobileSmall(context)) {
      return Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      );
    }
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}