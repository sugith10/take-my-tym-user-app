import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_option_button.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/star_icon.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: MyAppPadding.homePadding,
            right: MyAppPadding.homePadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //profile section begin
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                        // color: Colors.green,

                        width: MediaQuery.of(context).size.width / 2 -
                            MyAppPadding.homePadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sugith K',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(height: 10.h),
                            //star begin
                            Container(
                              height: 25.h,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.yellow,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      MyAppRadius.borderRadius)),
                              child: IntrinsicWidth(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(width: 2.w),
                                    const StarIcon(
                                      fill: true,
                                    ),
                                    const StarIcon(fill: true),
                                    const StarIcon(fill: true),
                                    const StarIcon(fill: true),
                                    const StarIcon(
                                      fill: false,
                                    ),
                                    SizedBox(width: 2.w),
                                  ],
                                ),
                              ),
                            )
                            //star end
                            ,
                            SizedBox(height: 10.h),
                            //location start
                            Text(
                              'Calicut, Kerala, India',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            //location end
                          ],
                        ),
                      ),
                      //Photo begin
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5,
                            ),
                            shape: BoxShape.circle),
                        child: const CircleProfilePicture(
                          height: 100,
                          width: 100,
                          image: MyAppImages.testProfile,
                        ),
                      ),
                      const Spacer(),
                      //photo ends
                    ],
                  ),
                ), // pofile section ends here
                //about section
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Hey there! I'm Sugith K, a 25-year-old Mobile App Developer from the bustling city of Mumbai. I’m all about bringing ideas to life through vibrant and meaningful designs. Creativity runs through my veins, and I'm committed to making every project a visual masterpiece.",
                        style: Theme.of(context).textTheme.labelMedium,
                        // maxLines: 5,
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                )
                //about section ends here
                ,
                SizedBox(
                  height: 20.h,
                ),
                const Row(
                  children: [
                    ProfileOptionButton(
                      action: 'Edit Profile',
                    ),
                    Spacer(),
                    ProfileOptionButton(
                      action: 'Share Profile',
                    ),
                    Spacer(),
                    ProfileOptionButton(
                      action: 'Contact',
                    )
                  ],
                )
                //about section ends here
                ,
                SizedBox(
                  height: 20.h,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                )
                //advertisement
                ,
                const ToggleButton(),
                const SizedBox(
                  height: 20,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  //  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: MyAppPadding.homePadding),
                      child: PostedContentWidget(
                        service: 'Remote',
                        title: 'Timeless beauty of moments captured',
                        image: MyAppImages.testOne,
                        subtitle:
                            'Timeless beauty of moments capturedTimeless beauty of moments capturedTimeless beauty of moments capturedTimeless beauty of moments captured',
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 40,
        width: 200,
        color: Colors.yellowAccent,
      ),
    );
  }
}
