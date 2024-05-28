import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AuthBackButton extends StatelessWidget {
  final VoidCallback callback;
  const AuthBackButton({
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: IconButton(
          onPressed: () {
            callback();
          },
          icon: const Icon(
            IconlyBroken.arrow_left,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
