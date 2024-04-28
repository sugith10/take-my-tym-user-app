import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class WalletCard extends StatelessWidget {
  final double balance;
  const WalletCard({
    required this.balance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 300.h,
        maxWidth: 600.h,
      ),
      child: Container(
        height: 150.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 78, 78, 78),
                Color.fromRGBO(0, 0, 0, 1),
              ],
              center: Alignment.topLeft,
              radius: 0.9,
            ),
            borderRadius:
                BorderRadius.all(Radius.circular(MyAppRadius.borderRadius))),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Main Balance',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 5),
            Text(
              '₹${balance.toString()}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _TransactionButton(
                  icon: IconlyLight.arrow_up,
                  title: 'Top up',
                  function: () {
                    log('Top up');
                  },
                ),
                SizedBox(
                  height: 20.h,
                  child: const VerticalDivider(),
                ),
                _TransactionButton(
                  icon: IconlyLight.arrow_down,
                  title: 'Withdraw',
                  function: () {
                    log('Withdraw');
                  },
                ),
                SizedBox(
                  height: 20.h,
                  child: const VerticalDivider(),
                ),
                _TransactionButton(
                  icon: IconlyLight.swap,
                  title: 'Transfer',
                  function: () {
                    log('transfer');
                  },
                )
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class _TransactionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;
  const _TransactionButton({
    required this.icon,
    required this.title,
    required this.function,
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
