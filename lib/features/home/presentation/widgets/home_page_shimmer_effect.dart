import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class HomePageShimmerEffect extends StatelessWidget {
  const HomePageShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           ShimmerPro.generated(
            light: ShimmerProLight.lighter,
            scaffoldBackgroundColor: MyAppDarkColor().background,
            child: Column(
              children: [
             
                ShimmerPro.sized(
                  light: ShimmerProLight.lighter,
                  scaffoldBackgroundColor: MyAppDarkColor().background,
                  height: 150,
                  width: 400,
                ),
                ShimmerPro.text(
                  maxLine: 5,
                  light: ShimmerProLight.lighter,
                  width: 450,
                  scaffoldBackgroundColor: MyAppDarkColor().background,
                ),
              ],
            )),
                ShimmerPro.generated(
            light: ShimmerProLight.lighter,
            scaffoldBackgroundColor: MyAppDarkColor().background,
            child: Column(
              children: [
             
                ShimmerPro.sized(
                  light: ShimmerProLight.lighter,
                  scaffoldBackgroundColor: MyAppDarkColor().background,
                  height: 150,
                  width: 400,
                ),
                ShimmerPro.text(
                  maxLine: 5,
                  light: ShimmerProLight.lighter,
                  width: 450,
                  scaffoldBackgroundColor: MyAppDarkColor().background,
                ),
              ],
            )),
     
           ShimmerPro.generated(
            light: ShimmerProLight.lighter,
            scaffoldBackgroundColor: MyAppDarkColor().background,
            child: Column(
              children: [
             
                ShimmerPro.sized(
                  light: ShimmerProLight.lighter,
                  scaffoldBackgroundColor: MyAppDarkColor().background,
                  height: 150,
                  width: 400,
                ),
                ShimmerPro.text(
                  maxLine: 5,
                  light: ShimmerProLight.lighter,
                  width: 450,
                  scaffoldBackgroundColor: MyAppDarkColor().background,
                ),
              ],
            )),
      ],
    );
  }
}