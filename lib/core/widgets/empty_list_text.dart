import 'package:flutter/material.dart';

class EmptyListText extends StatelessWidget {
  final double padding;
  const EmptyListText({
    required this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: padding),
      child: const Text("No items to display"),
    );
  }
}