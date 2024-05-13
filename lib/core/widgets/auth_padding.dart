import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class AuthPadding extends StatelessWidget {
  final Widget child;

  const AuthPadding({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MyAppPadding.authPadding,
      ),
      child: child,
    );
  }
}
