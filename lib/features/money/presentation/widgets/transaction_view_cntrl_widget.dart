import 'package:flutter/material.dart';

class TransactionViewCntrlWidget extends StatelessWidget {
  final Function function;
  const TransactionViewCntrlWidget({
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
