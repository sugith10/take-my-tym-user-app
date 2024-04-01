import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SignBackButton extends StatelessWidget {

  const SignBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
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