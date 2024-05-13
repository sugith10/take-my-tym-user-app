import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class HomePadding extends StatelessWidget {
  final Widget child;

  const HomePadding({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MyAppPadding.homePadding,
      ),
      child: child,
    );
  }
}
