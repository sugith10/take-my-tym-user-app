import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/app_logo.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/welcome_page_animation.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: MyAppPadding.authPadding,
                  right: MyAppPadding.authPadding,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    const AppLogo(),
                    const Spacer(flex: 2),
                    const WelcomePageAnimation(),
                    const Spacer(
                      flex: 2,
                    ),
                    SizedBox(height: 20.h),
                    SignButtonWidget(
                      title: 'Login',
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const SignInPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    const TermsAndConditons(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
