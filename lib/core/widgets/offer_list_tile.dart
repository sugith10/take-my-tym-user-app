import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../theme/color/app_colors.dart';

class OfferListTile extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OfferListTile({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40.0,
      ),
      onTap: () {
        onPressed();
      },
      title: Text(text, style: Theme.of(context).textTheme.labelLarge),
      trailing: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          IconlyLight.arrow_right_circle,
          size: 35,
          color: AppDarkColor.instance.primaryTextSoft,
        ),
      ),
      enableFeedback: true,
      enabled: true,
    );
  }
}
