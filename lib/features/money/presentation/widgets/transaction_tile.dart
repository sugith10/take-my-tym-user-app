import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_assets.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/features/money/presentation/widgets/transaction_dialog.dart';

class TransactionTile extends StatelessWidget {
  final String amount;
  final String name;
  final String time;

  final String image;
  const TransactionTile({
    required this.name,
    required this.time,
    required this.amount,
    this.image = MyAppImages.profileIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return TransactionDialog(
                amount: amount,
                from: name,
                image: image,
                time: time,
              );
            });
        log('GlassMorphism');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
          color: MyAppDarkColor.instance.secondaryBackground,
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
            child: Image.asset(
              image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          subtitle: Text(
            time,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Text(
            '₹$amount',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
