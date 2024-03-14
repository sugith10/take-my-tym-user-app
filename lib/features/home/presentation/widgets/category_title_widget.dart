import 'package:flutter/material.dart';

class CategoryTitleWidget extends StatelessWidget {
  final String title;
  const CategoryTitleWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Divider(
            color: Color.fromRGBO(255, 255, 255, 0.963),
          ),
        ),
      ],
    );
  }
}