import 'package:flutter/material.dart';

class PostDescriptionWidget extends StatelessWidget {
  final String description;
  const PostDescriptionWidget({
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: const Color.fromARGB(199, 255, 255, 255),
          ),
      textAlign: TextAlign.justify,
    );
  }
}
