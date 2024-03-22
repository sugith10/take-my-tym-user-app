import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BackNavigationButton extends StatelessWidget {
  const BackNavigationButton({
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