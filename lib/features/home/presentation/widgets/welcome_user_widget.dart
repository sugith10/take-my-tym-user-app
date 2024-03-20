import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class WelcomeUser extends StatelessWidget {
  final String user;
  const WelcomeUser({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: MyAppPadding.homePadding),
      child: Text(
        'Hi, $user...',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
