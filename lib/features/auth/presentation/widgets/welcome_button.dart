import 'package:button_animations/button_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/route/route_name/app_route_name.dart';

import '../../../../core/theme/color/app_colors.dart';
import '../../../../core/util/app_vibration.dart';
import 'sign_button_text.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AnimatedButton(
        onTap: () {
          AppVibration.hapticFeedbackHeavy();
          Navigator.pushNamed(context, RouteName.signIn);
        },
        type: null,
        height: 55,
        isOutline: true,
        shadowHeightBottom: 4,
        shadowHeightLeft: 4,
        width: 300.w,
        borderRadius: 2,
        color: AppDarkColor.instance.buttonBackground,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SignButtonText(
              title: "LOGIN",
            )
          ],
        ),
      ),
    );
  }
}
