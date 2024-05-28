import 'package:flutter/material.dart';
import 'package:take_my_tym/core/const/app_padding.dart';

class HomePadding extends StatelessWidget {
  final Widget child;

  const HomePadding({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPading.homePadding,
      ),
      child: child,
    );
  }
}
