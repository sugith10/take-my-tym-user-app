import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButtonWidget(),
    );
  }
  

  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}