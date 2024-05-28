import 'package:flutter/material.dart';
import 'package:take_my_tym/core/const/app_padding.dart';

class AuthPadding extends StatelessWidget {
  final Widget child;

  const AuthPadding({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPading.authPadding,
      ),
      child: child,
    );
  }
}
