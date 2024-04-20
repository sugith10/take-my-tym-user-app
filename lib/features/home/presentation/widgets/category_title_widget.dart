import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

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
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
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
