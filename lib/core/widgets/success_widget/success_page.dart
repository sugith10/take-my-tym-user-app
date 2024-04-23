import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/close_icon_button.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';
import 'package:take_my_tym/features/post/presentation/widgets/scale_up.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

part 'util/feedback.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  
  @override
  void initState() {
    super.initState();
    _Feedback().playSound();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(MyAppImages.successLottie,
                      repeat: false, height: 500, width: 500),
                  FadeIn(
                    delay: const Duration(milliseconds: 1500),
                    duration: const Duration(milliseconds: 1500),
                    child: const Center(
                      child: ZoomAnimationWidget(),
                    ),
                  ),
                ],
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 1500),
                duration: const Duration(milliseconds: 1500),
                child: Text("Create Successfully",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: 10.h),
              FadeInDown(
                delay: const Duration(milliseconds: 1500),
                duration: const Duration(milliseconds: 1500),
                child: Text(
                  "Your tym post now accessible to the world...",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: MyAppDarkColor.instance.primaryTextSoft),
                ),
              ),
              SizedBox(height: 60.h),
              FadeIn(
                delay: const Duration(milliseconds: 2550),
                duration: const Duration(milliseconds: 2550),
                child: Column(
                  children: [
                    const Text('This page will automatically closed in'),
                    const SizedBox(height: 5),
                    const Text('5  :  seconds'),
                    const SizedBox(height: 40),
                    CloseIconButton(
                      callback: () {
                        // Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          NavigationMenu.route(),
                          (route) => false,
                        );
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: MyAppDarkColor.instance.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
