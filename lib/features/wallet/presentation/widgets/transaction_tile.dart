import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/theme/color/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class TransactionTile extends StatelessWidget {
  final String amount;
  final bool type;
  final String time;
  const TransactionTile({
    required this.type,
    required this.time,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color color =
        type ? AppDarkColor.instance.success : AppDarkColor.instance.danger;
    return GestureDetector(
      onTap: () {
        // showDialog(
        //     context: context,
        //     builder: (_) {
        //       return TransactionDialog(
        //         amount: amount,
        //         from: name,
        //         image: image,
        //         time: time,
        //       );
        //     });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.borderRadius),
          color: AppDarkColor.instance.secondaryBackground,
        ),
        child: ListTile(
          // leading: ClipRRect(
          //   borderRadius: BorderRadius.circular(AppRadius.borderRadius),
          //   child: Image.asset(
          //     image,
          //     height: 50,
          //     width: 50,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          title: Text(
            type ? "Credit" : "Debit",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          subtitle: Text(
            time,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: _Amount(type: type, color: color, amount: amount),
        ),
      ),
    );
  }
}

class _Amount extends StatelessWidget {
  const _Amount({
    required this.type,
    required this.color,
    required this.amount,
  });

  final bool type;
  final Color color;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: type ? '+' : '-',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(color: color),
            children: [
          TextSpan(
            text: ' ₹$amount',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
          )
        ]));
  }
}
