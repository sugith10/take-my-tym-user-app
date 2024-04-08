import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
      actions: [ActionButton(action: 'Finsh Profile', callback: (){})],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: AuthPadding(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  const HeadLineWidget(),
                  SizedBox(height: 35.h),
                  const AppExplainWidget(
                    number: 1,
                    title: "What is Gig Economy",
                    content:
                        "Gig economy is a concept where individuals work short-term jobs and make a living out of it.",
                  ),
                  SizedBox(height: 25.h),
                  const AppExplainWidget(
                    number: 2,
                    title: "How TakeMyTym is Related with Gig",
                    content:
                        "TakeMyTym links people with short-term tasks, embracing the gig economy's adaptable work ethos.",
                  ),
                  SizedBox(height: 25.h),
                  const AppExplainWidget(
                    number: 3,
                    title: "What is BuyTym",
                    content:
                        "BuyTym allows users to post tasks they need help with, purchasing others' time to get things done.",
                  ),
                  SizedBox(height: 25.h),
                  const AppExplainWidget(
                    number: 4,
                    title: "What is SellTym",
                    content:
                        "SellTym allows users to showcase their skills, offering their expertise and sell it.",
                  ),
                  SizedBox(height: 40.h),
                  // Container(
                  //   height: 40.h,
                  //   width: 200.w,
                  //   decoration:
                  //       BoxDecoration(
                  //         border: Border.all(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(10)
                  //         ),
                  // ),
                  //  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeadLineWidget extends StatelessWidget {
  const HeadLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Its Time to Redifine",
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontFamily: 'Denton Condensed'),
        ),
        const SizedBox(height: 10),
        Text(
          "How You Earn",
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontFamily: 'Denton Condensed'),
        ),
        SizedBox(height: 15.h),
        Text(
          "Your skills are your currency in today's digital economy",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: MyAppDarkColor().primaryTextSoft),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class AppExplainWidget extends StatelessWidget {
  final int number;
  final String title;
  final String content;
  const AppExplainWidget({
    required this.number,
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: '$number.',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontFamily: 'Denton Condensed',
                    color: MyAppDarkColor().primaryTextSoft,
                    fontWeight: FontWeight.w900,
                  ),
              children: [
                const TextSpan(text: '    '),
                TextSpan(
                  text: "$title :",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'Denton Condensed',
                        color: MyAppDarkColor().primaryTextSoft,
                        fontWeight: FontWeight.w800,
                      ),
                )
              ]),
        ),
        const SizedBox(height: 15),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: MyAppDarkColor().primaryTextSoft),
        ),
      ],
    );
  }
}
