import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/bottom_to_top.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/app_box_widget.dart';
import 'package:take_my_tym/core/widgets/app_title_box_widget.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/submit_button.dart';
import 'package:take_my_tym/features/checkout/presentation/pages/proposel_time_line.dart';
import 'package:take_my_tym/features/checkout/presentation/widgets/animated_dot_widget.dart';

class SubmitProposelPage extends StatefulWidget {
  const SubmitProposelPage({super.key});

  static route() => bottomToTop(const SubmitProposelPage());

  @override
  State<SubmitProposelPage> createState() => _SubmitProposelPageState();
}

class _SubmitProposelPageState extends State<SubmitProposelPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(IconlyLight.arrow_down_2),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      2,
                      (value) => Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: AnimatedDot(isActive: value == index),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SliverFillRemaining(
              child: PageView.builder(
                itemCount: 2,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                    log("index: $index");
                  });
                },
                itemBuilder: (context, value) {
                  if (value == 1) {
                    return SizedBox(
                      width: double.infinity,
                      // color: Colors.amber,
                      child: HomePadding(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            
                            SizedBox(height: 5.h),
                            AppTitleBoxWidget(title:  "Gave a message to creator",
                            
                            child: SizedBox(
                              height: 100.h,
                              child: SingleChildScrollView(
                                
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText:
                                          "Why the creator want to hire you",
                                      hintStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    maxLines: null,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                        keyboardType: TextInputType.text,
                                  ),
                                ),
                            ),
                            ),
                            // AppBoxWidget(
                            //   height: 100.h,
                            //   child: 
                            // ),
                            SizedBox(height: 20.h),
                            Text(
                              "Note: Before commit with any contract make sure you reachout contracter and verified the source.",
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Expanded(
                                    child: SubmitButton(
                                        callback: () {}, text: 'Submit')),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return const ProposelTimeLine();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
