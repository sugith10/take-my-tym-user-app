import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            leading: BackNavigationButton(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                    left: MyAppPadding.homePadding,
                    right: MyAppPadding.homePadding,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        'Elevate Your Brand with Graphic Design Expertise',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(height: 15.h), 
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Service Type: Remote',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleProfilePicWidget(
                            height: 75,
                            width: 75,
                            image: MyAppImages.testProfile,
                          ),
                          Text(
                            'Dilshad D',
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Offering expert services in mobile app designs, website layouts, and stunning graphics. Elevate your brand with Anika's creative vision, attention to detail, and dedication to excellence. Ready to transform your brand's visual identity? I specialize in creating mesmerizing mobile app designs, captivating website layouts, and stunning graphics. With a keen eye for detail and a dedication to excellence, I bring your vision to life. Invest in design brilliance for just ₹15,000. Let's make your brand unforgettable! 🚀🌈",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: const Color.fromARGB(199, 255, 255, 255),
                        ),
                        textAlign: TextAlign.justify,

                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
