import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/images.dart';
import 'package:take_my_tym/core/widgets/sign_button.dart';
import 'package:take_my_tym/core/widgets/svg_image_widget.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          // width: MediaQuery.of(context).size.width,
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
                paddingL: 20,
                paddingR: 20,
              ),
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
              GestureDetector(
                onTap: (){
                  print('hello');
                },
                child: RichText(
                  text: TextSpan(
                    text: "By Proceeding, I accept TakeMyTym's ",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                      color: Theme.of(context).textTheme.labelSmall!.color,
                    ),
                    children: [
                      TextSpan(
                        text: "T&C ",
                    style: TextStyle(
                 
                      decoration: TextDecoration.underline,
                      decorationColor: MyAppDarkColor().secondaryText,
                      fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                    ),
                      )
                    ]
                  ),
                  
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
