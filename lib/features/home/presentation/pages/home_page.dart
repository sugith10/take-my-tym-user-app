import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/home/presentation/widgets/category_title_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/location_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/generate_feed_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/search_button.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/welcome_user_widget.dart';
import 'package:take_my_tym/features/search/presentation/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.density_medium),
            ),
            actions: [
              LocationWidget(
                function: () {},
              ),
              // const SizedBox(width: 5)
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20.h),
                const WelcomeUser(
                  user: 'Sugith',
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: MyAppPadding.homePadding),
                    child: Row(
                      children: [
                        const SwitchCategoryWidget(),
                        SizedBox(width: 5.w),
                        SearchButton(
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SearchPage(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                const CategoryTitleWidget(
                  title: "Look's Interesting",
                ),
                SizedBox(height: 20.h),
                const GenerateFeedWidget(
                  service: 'Remote',
                  title: 'Timeless beauty of moments captured',
                  image: MyAppImages.testTwo,
                ),
                SizedBox(height: 30.h),
                const CategoryTitleWidget(
                  title: "Latest Offerings",
                ),
                SizedBox(height: 20.h),
                const GenerateFeedWidget(
                  service: 'Local',
                  title: 'Timeless beauty of moments captured',
                  image: MyAppImages.testTwo,
                ),
                SizedBox(height: 30.h),
                const CategoryTitleWidget(
                  title: "Look's Interesting",
                ),
                SizedBox(height: 20.h),
                const GenerateFeedWidget(
                  service: 'Remote',
                  title: 'Timeless beauty of moments captured',
                  image: MyAppImages.testOne,
                ),
                SizedBox(height: 30.h),
                SizedBox(height: 30.h),
                const CategoryTitleWidget(
                  title: "Look's Interesting",
                ),
                SizedBox(height: 20.h),
                const GenerateFeedWidget(
                  service: 'Remote',
                  title: 'Timeless beauty of moments captured',
                  image: MyAppImages.testOne,
                ),
                SizedBox(height: 30.h),
                SizedBox(height: 30.h),
                const CategoryTitleWidget(
                  title: "Look's Interesting",
                ),
                SizedBox(height: 20.h),
                const GenerateFeedWidget(
                  service: 'Remote',
                  title: 'Timeless beauty of moments captured',
                  image: MyAppImages.testOne,
                ),
                SizedBox(height: 30.h),
                SizedBox(height: 30.h),
                const CategoryTitleWidget(
                  title: "Look's Interesting",
                ),
                SizedBox(height: 20.h),
                const GenerateFeedWidget(
                  service: 'Remote',
                  title: 'Timeless beauty of moments captured',
                  image: MyAppImages.testOne,
                ),
                SizedBox(height: 30.h),
                SizedBox(height: 30.h),
                const CategoryTitleWidget(
                  title: "Look's Interesting",
                ),
                SizedBox(height: 20.h),
                const GenerateFeedWidget(
                  service: 'Remote',
                  title: 'Timeless beauty of moments captured',
                  image: MyAppImages.testOne,
                ),
                SizedBox(height: 30.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
