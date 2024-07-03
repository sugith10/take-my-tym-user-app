import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/assets/app_lottie.dart';
import '../../../../core/const/app_radius.dart';

final class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotLottieLoader.fromAsset(
                AppLottie.noInternet,
                frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(dotlottie.animations.values.single);
                  } else {
                    return const Text("Error");
                  }
                },
              ),
            ),
            Text(
              "No Internet Connection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10.h),
            Text(
              "check your internet connection and try again",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50.sp, 40.sp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.borderRound),
                ),
              ),
              child: const Text("Refresh"),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
