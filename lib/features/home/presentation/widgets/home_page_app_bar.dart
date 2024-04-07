import 'package:flutter/material.dart';
import 'package:take_my_tym/features/home/presentation/widgets/location_widget.dart';

class HomePageAppBar extends StatelessWidget {
  final VoidCallback openDrawer;
  final VoidCallback location;
  const HomePageAppBar({
    required this.openDrawer,
    required this.location,
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
      actions: [
        LocationWidget(
          callback: () => location(),
        ),
      ],
    );
  }
}
