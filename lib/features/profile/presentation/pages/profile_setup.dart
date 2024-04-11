import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: AuthPadding(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 45.h),

                  const HeadLineWidget(),
                  SizedBox(height: 45.h),
                  // const AppExplainWidget(
                  //   number: 1,
                  //   title: "What is Gig Economy",
                  //   content:
                  //       "Gig economy is a concept where individuals work short-term jobs and make a living out of it.",
                  // ),
                  // SizedBox(height: 25.h),
                  const AppExplainWidget(
                    number: 1,
                    title: "What is TakeMyTym",
                    content:
                        "TakeMyTym links people with short-term tasks, embracing the gig economy's adaptable work ethos.",
                  ),
                  SizedBox(height: 25.h),
                  const AppExplainWidget(
                    number: 2,
                    title: "What is BuyTym",
                    content:
                        "BuyTym allows users to post tasks they need help with, purchasing others' time to get things done.",
                  ),
                  SizedBox(height: 25.h),
                  const AppExplainWidget(
                    number: 3,
                    title: "What is SellTym",
                    content:
                        "SellTym allows users to showcase their skills, offering their expertise and sell it.",
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const NavigationMenu()));
                  //   },
                  //   child: Container(
                  //     height: 42.5.h,
                  //     width: 150.w,
                  //     decoration: BoxDecoration(

                  //         border: Border.all(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: Center(
                  //         child: Text(
                  //       "Next",
                  //       style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  //          letterSpacing: 1,
                  //          fontWeight: FontWeight.w700,
                  //          color: MyAppDarkColor().primaryTextBlur
                  //          ),
                  //     )),
                  //   ),
                  // ),
                  SizedBox(height: 60.h),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black,
                          offset: Offset(5, 5),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                        BoxShadow(
                            color: Colors.grey.shade800,
                            offset: const Offset(-2, -2),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ],
                    ),
                    child: FadeIn(
                        delay: const Duration(milliseconds: 300),
                        duration: const Duration(milliseconds: 1000),
                        child:  Center(child: Text("Next", style: Theme.of(context).textTheme.headlineSmall,))),
                  ),
                 
                  SizedBox(height: 60.h),
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
        Text("Its Time to Redifine",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontWeight: FontWeight.w800, letterSpacing: .5)),
        const SizedBox(height: 10),
        Text("How You Earn",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontWeight: FontWeight.w800, letterSpacing: .5)),
        SizedBox(height: 20.h),
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
                    color: MyAppDarkColor().primaryTextSoft,
                    fontWeight: FontWeight.w700,
                  ),
              children: [
                const TextSpan(text: '  '),
                TextSpan(
                  text: "$title :",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyAppDarkColor().primaryTextSoft,
                        fontWeight: FontWeight.w800,
                        letterSpacing: .5,
                      ),
                )
              ]),
        ),
        const SizedBox(height: 15),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: MyAppDarkColor().primaryTextSoft),
        ),
      ],
    );
  }
}
