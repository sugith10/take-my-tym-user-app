import 'package:button_animations/button_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_vibration.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button_text.dart';

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
          HapticFeedbackVibration().vibrate();
          Navigator.push(
            context,
            SignInPage.route(),
          );
        },
        type: null,
        height: 55,
        isOutline: true,
        shadowHeightBottom: 4,
        shadowHeightLeft: 4,
        width: 300.w,
        borderRadius: 2,
        color: MyAppDarkColor.instance.buttonBackground,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SignButtonText(
              text: "LOGIN",
            )
          ],
        ),
      ),
    );
  }
}
