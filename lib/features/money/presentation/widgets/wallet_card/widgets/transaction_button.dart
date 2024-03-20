import 'package:flutter/material.dart';

class TransactionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;
  const TransactionButton({
    required this.icon,
    required this.title,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}