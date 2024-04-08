import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileLocationWidget extends StatelessWidget {
  final String? location;
  const ProfileLocationWidget({
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(IconlyLight.location),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            location != null ? location! : 'Not Provided',
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
