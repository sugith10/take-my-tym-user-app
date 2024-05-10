import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LocationPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const LocationPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(IconlyLight.arrow_down_2),
      ),
      title: const Text("Select a location"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
