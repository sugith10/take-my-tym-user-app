import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SignBackButton extends StatelessWidget {
  const SignBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 900),
      duration: const Duration(milliseconds: 1000),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          IconlyBroken.arrow_left,
          color: Colors.white,
        ),
      ),
    );
  }
}