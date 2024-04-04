import 'package:flutter/material.dart';

class PopupMenuItemChildWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  const PopupMenuItemChildWidget({
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 20),
        Text(
          value,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
