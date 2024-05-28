import 'package:flutter/material.dart';
import 'package:take_my_tym/core/theme/color/app_colors.dart';

class ProfileInfoWidget extends StatelessWidget {
  final String? text;
  final IconData icon;
  const ProfileInfoWidget({
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: AppDarkColor.instance.secondaryText,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text != null ? text! : '',
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
