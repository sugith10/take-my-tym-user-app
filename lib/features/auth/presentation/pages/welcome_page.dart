import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/sign_button.dart';
import 'package:take_my_tym/core/widgets/svg_image_widget.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/navigation_taxt_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
                left: MyAppPadding.padding, right: MyAppPadding.padding),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  "Where Time Meets Oppurtunity",
                  style: TextStyle(fontSize: 17.sp),
                ),
                const SizedBox(height: 20),
                SVGImageWidget(
                  asset: MyAppImages().onboarding,
                  height: 40,
                ),
                const Spacer(),
                Lottie.asset('asset/json/onboarding_animation_1.json'),
               const Spacer(),
                SignButtonWidget(
                  title: 'Login',
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignInPage()));
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                NavigationText(
                  leadingText: "By proceeding, I accept TakeMyTym's",
                  buttonText: 'T&C',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                ),
                NavigationText(
                  leadingText: "and",
                  buttonText: 'Privacy Policy.',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
