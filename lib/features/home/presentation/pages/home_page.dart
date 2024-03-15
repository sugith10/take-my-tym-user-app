import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/home/presentation/pages/nav_bar.dart';
import 'package:take_my_tym/features/home/presentation/widgets/category_title_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/location_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/posted_content_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/search_button.dart';
import 'package:take_my_tym/features/home/presentation/widgets/welcome_user_widget.dart';
import 'package:take_my_tym/features/search/presentation/pages/search_page.dart';

class HomePage extends StatefulWidget {
  final AuthUserModel user;
  const HomePage({required this.user, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name;
  @override
  void initState() {
    super.initState();
    if (widget.user.email != null) {
      name = widget.user.email!;
    } else {
      name = "sugith";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.density_medium)),

            actions: [
              LocationWidget(
                function: () {},
              ),
              const SizedBox(width: 10)
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                    left: MyAppPadding.paddingTwo,
                    right: MyAppPadding.paddingTwo,
                  ),
                  child: SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      const WelcomeUser(
                        user: 'Sugith',
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            //togle switch start
                            // CustomToggle(onChanged: (value){},value: true,)
                            Container(
                              width: 150,
                              height: 20,
                              color: Colors.amber,
                            ),
                            //togle switch start
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
                      SizedBox(height: 30.h),
                      const CategoryTitleWidget(
                        title: "Look's Interesting",
                      ),
                      SizedBox(height: 20.h),
                      const PostedContent(
                        service: 'Remote',
                        title: 'Timeless beauty of moments captured',
                        image: MyAppImages.testOne,
                      ),
                      SizedBox(height: 30.h),
                      const CategoryTitleWidget(
                        title: "Latest Offerings",
                      ),
                      SizedBox(height: 20.h),
                      const PostedContent(
                        service: 'Local',
                        title: 'Timeless beauty of moments captured',
                        image: MyAppImages.testOne,
                      ),
                    ],
                  )),
                )
              ],
            ),
          )
        ],
      ),
      //  bottomNavigationBar: ,
    );
  }
}
