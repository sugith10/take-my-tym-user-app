import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color/app_colors.dart';
import 'app_info_dailog.dart';

class TakeyMyTymDailog {
  void show({required BuildContext context}) {
    AppInfoDialog.show(context: context, widget: const _AppInfoContents());
  }
}

class _AppInfoContents extends StatelessWidget {
  const _AppInfoContents();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HeadLineWidget(),
        SizedBox(height: 20.h),
        const Divider(),
        SizedBox(height: 20.h),
        const _ExplainWidget(
          number: 1,
          title: "What is TakeMyTym",
          content:
              "TakeMyTym links people with short-term tasks, embracing the gig economy's adaptable work ethos.",
        ),
        SizedBox(height: 25.h),
        const _ExplainWidget(
          number: 2,
          title: "What is BuyTym",
          content:
              "BuyTym allows users to post tasks they need help with, purchasing others' time to get things done.",
        ),
        SizedBox(height: 25.h),
        const _ExplainWidget(
          number: 3,
          title: "What is SellTym",
          content:
              "SellTym allows users to showcase their skills, offering their expertise and sell it.",
        ),
      ],
    );
  }
}

class _HeadLineWidget extends StatelessWidget {
  const _HeadLineWidget();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text("Its time to redifine",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(letterSpacing: .5, fontSize: size.width * 0.06)),
        const SizedBox(height: 10),
        Text("how you earn...",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(letterSpacing: .5, fontSize: size.width * 0.06)),
      ],
    );
  }
}

class _ExplainWidget extends StatelessWidget {
  final int number;
  final String title;
  final String content;
  const _ExplainWidget({
    required this.number,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: '$number.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: size.width * 0.04
                ),
            children: [
              const TextSpan(text: '  '),
              TextSpan(
                text: "$title ",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: .5,
                      fontSize: size.width * 0.038
                    ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(
                fontSize: size.width * 0.035,
                color: AppDarkColor.instance.primaryTextSoft),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
