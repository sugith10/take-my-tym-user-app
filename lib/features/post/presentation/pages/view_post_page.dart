import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/post/presentation/widgets/chat_floating_action_button.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_description_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_owner_info_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_service_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_specifications_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_title_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/skills_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/submit_button.dart';


List<String> skillList = [
  'Skills and Expertise',
  'Skills and Expertise',
  'Skills and Expertise',
  'Skills and Expertise',
  'Skills and Expertise',
];

class ViewPostPage extends StatelessWidget {
  const ViewPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              leading: BackButtonWidget(),
            ),
            // TODO: implement listener
            // covert to Sliver Fill Remaining 
            // learn about Sliver in detail
            // SliverFillRemaining(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  HomePadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        const ServiceTypeWidget(type: "Remote"),
                        SizedBox(height: 15.h),
                        const PostTitleWidget(
                          title:
                              'Elevate Your Brand with Graphic Design Expertise',
                        ),
                        SizedBox(height: 20.h),
                        const PostOwnerInfoWidget(
                          name: 'Dilshad D',
                          image: MyAppImages.testProfile,
                          date: 'Oct 15,2023',
                        ),
                        SizedBox(height: 20.h),
                        const PostDescriptionWidget(
                          description:
                              "Offering expert services in mobile app designs, website layouts, and stunning graphics. Elevate your brand with Anika's creative vision, attention to detail, and dedication to excellence. Ready to transform your brand's visual identity? I specialize in creating mesmerizing mobile app designs, captivating website layouts, and stunning graphics. With a keen eye for detail and a dedication to excellence, I bring your vision to life. Invest in design brilliance for just ₹15,000. Let's make your brand unforgettable! 🚀🌈",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Divider(),
                  SizedBox(height: 20.h),
                  HomePadding(child: SkillsWidget(skillList: skillList,)),
                  SizedBox(height: 20.h),
                  const Divider(),
                  SizedBox(height: 20.h),
                  const HomePadding(
                    child: PostConstraintsWidget(
                      location: "Kozhikode",
                      level: "Intermediate",
                      amount: 15000,
                      flexible: true,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ChatFloatingActionButton(
        callBack: () {},
      ),
      bottomNavigationBar: SubmitButton(
        callback: () {},
      ),
    );
  }
}
