import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

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
      title: Text(text, style: Theme.of(context).textTheme.labelLarge),
      trailing: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          IconlyLight.arrow_right_circle,
          size: 35,
          color: MyAppDarkColor.instance.primaryTextSoft,
        ),
      ),
      enableFeedback: true,
      enabled: true,
    );
  }
}