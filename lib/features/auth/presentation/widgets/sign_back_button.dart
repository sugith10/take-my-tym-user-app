import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SignBackButton extends StatelessWidget {
  final VoidCallback callback;
  const SignBackButton(
    {
    required this. callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: IconButton(
        onPressed: () {
          
        },
        icon: const Icon(
          IconlyBroken.arrow_left,
          color: Colors.white,
        ),
      ),
    );
  }
}