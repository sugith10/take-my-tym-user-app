import 'package:flutter/material.dart';

import '../../../../core/widgets/not_yet_widget.dart';

class NoTransactionWidget extends StatelessWidget {
  const NoTransactionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          Spacer(flex: 1),
          NotYetWidget(
            title: "No Transactions yet",
            subtitle: "You'll find your transactions all right here",
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}