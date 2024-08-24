import 'package:flutter/material.dart';

class PostTitleWidget extends StatelessWidget {
  final String title;
  const PostTitleWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}