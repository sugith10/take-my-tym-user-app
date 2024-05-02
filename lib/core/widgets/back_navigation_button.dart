import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BackButtonWidget extends StatelessWidget {
  final bool normal;
  const BackButtonWidget({
    this.normal = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(normal ? IconlyLight.arrow_left : IconlyLight.arrow_down_2),
    );
  }
}
