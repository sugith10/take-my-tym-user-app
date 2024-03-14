import 'package:flutter/material.dart';

class WelcomeUser extends StatelessWidget {
  final String user;
  const WelcomeUser({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi, $user...',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
