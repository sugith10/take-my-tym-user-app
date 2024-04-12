import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LocationListTile extends StatelessWidget {
  final VoidCallback callback;
  final String location;
  const LocationListTile({
    required this.callback,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        callback();
      },
      leading: const Icon(IconlyLight.discovery),
      title: Text(
        location,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}