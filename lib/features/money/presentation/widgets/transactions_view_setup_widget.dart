import 'package:flutter/material.dart';

class TransactionsViewSetupWidget extends StatelessWidget {
  final Function function;
  const TransactionsViewSetupWidget({
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Last Transactions',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        InkWell(
          onTap: (){
            function();
          },
          child: Text(
            'View all',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        )
      ],
    );
  }
}
