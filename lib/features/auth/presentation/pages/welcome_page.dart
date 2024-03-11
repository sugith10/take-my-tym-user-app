import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/images.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text("Where Time Meets Oppurtunity", style: TextStyle(color: const Color.fromARGB(197, 255, 255, 255), fontSize: 17.sp),),
            const  SizedBox(height: 20),
               Padding(
                 padding: const EdgeInsets.only(left: 40,right: 40),
                 child: SvgPicture.asset(
                  MyAppImages().onboarding,
                  height: 40,
                 ),
               ),
    
             const Spacer(),
        
              Padding(
                padding: const EdgeInsets.only(right: 15,left: 15,),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignInPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:const Size(80, 60)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Login"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
