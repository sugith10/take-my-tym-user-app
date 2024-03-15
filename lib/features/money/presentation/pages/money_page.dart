import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: MyAppPadding.paddingTwo,
        
      right:   MyAppPadding.paddingTwo
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                  color: Color(0xff184047),
                  borderRadius: BorderRadius.all(
                      Radius.circular(MyAppPadding.borderRadius))),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'Main Balance',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '14,235.35',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TransactionButton(
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
                      TransactionButton(
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
                      TransactionButton(
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
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Row( children: [ 
              Text('Last Transactions', 
              style: Theme.of(context).textTheme.titleLarge,),
              const Spacer(),
              Text('View all' ,style:  Theme.of(context).textTheme.titleLarge)
            ],)
          ],
        ),
      ),
    );
  }
}

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
          SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
