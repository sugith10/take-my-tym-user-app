import 'package:flutter/material.dart';

class PostCategoryTitle extends StatelessWidget {
  final  String title;
  const PostCategoryTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}