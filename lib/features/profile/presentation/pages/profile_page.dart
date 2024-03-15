import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/star_icon.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: MyAppPadding.paddingTwo, right: MyAppPadding.paddingTwo),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              //profile section begin
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      color: Colors.green,
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2 -
                          MyAppPadding.paddingTwo,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sugith K',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 10.h),
                          //star begin
                          Container(
                            width: 100.h,
                            height: 25.h,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(
                                    MyAppPadding.borderRadius)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                StarIcon(),
                                StarIcon(),
                                StarIcon(),
                                StarIcon(),
                                StarIcon(),
                              ],
                            ),
                          )
                          //star end
                          ,
                          SizedBox(height: 10.h),
                          //location start
                          Text(
                            'Calicut, Kerala, India',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 15.5.sp,
                                ),
                          ),
                          //location end
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.amber,
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2 -
                          MyAppPadding.paddingTwo,
                      child: Padding(
                        padding: const EdgeInsets.all(00.0),
                        child: Container(
                          width: 25,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 80, 80, 80)
                                    .withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          
                          ),
                          child: ClipRRect(
                            child: Image.asset(MyAppImages.testProfile, fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
