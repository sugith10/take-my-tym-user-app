import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class ProfileLocationWidget extends StatelessWidget {
  final String? location;
  const ProfileLocationWidget({
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          IconlyLight.location,
          size: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: AppDarkColor.instance.secondaryText,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            location != null ? location! : '',
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
