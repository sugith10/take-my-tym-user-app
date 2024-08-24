import 'package:flutter/material.dart';

class OfferSubtitleWidget extends StatelessWidget {
  final String title;
  const OfferSubtitleWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}