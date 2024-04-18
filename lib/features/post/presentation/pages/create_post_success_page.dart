import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/features/post/presentation/pages/scale_up.dart';

class CreatePostSuccessPage extends StatelessWidget {
  const CreatePostSuccessPage({super.key});

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
              Text("Your tym post now accessible to the world...",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: MyAppDarkColor.instance.primaryTextSoft
              ),),
              SizedBox(height: 80.h),
             const Text('This page will automatically closed in')
             , const SizedBox(height: 5),
             const Text('5  :  seconds')
            ],
          ),
        ),
      ),
    );
  }
}
