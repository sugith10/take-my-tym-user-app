import 'package:flutter/material.dart';

import 'home_page_app_bar_location_widget.dart';

class HomePageAppBar extends StatelessWidget {
  final VoidCallback openDrawer;

  const HomePageAppBar({
    required this.openDrawer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => openDrawer(),
        icon: const Icon(Icons.density_medium),
      ),
      actions: const [
        MyLocationWidget(),
      ],
    );
  }
}
