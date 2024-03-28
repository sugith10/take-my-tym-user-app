import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(IconlyLight.arrow_left),
    );
  }
}