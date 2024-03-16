import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/home/presentation/widgets/category_title_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/location_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/posted_content_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/search_button.dart';
import 'package:take_my_tym/features/home/presentation/widgets/welcome_user_widget.dart';
import 'package:take_my_tym/features/search/presentation/pages/search_page.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/features/create_post/presentation/pages/create_post.dart';
import 'package:take_my_tym/features/message/presentation/pages/messages_page.dart';
import 'package:take_my_tym/features/money/presentation/pages/money_page.dart';
import 'package:take_my_tym/features/profile/presentation/pages/profile_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int index = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final screens = [
    HomePage(user: AuthUserModel(email: 'shsh')),
    const MessagePage(),
    const CreatePostPage(),
    const MoneyPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      body: SafeArea(child: screens[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) {
          setState(() {
            if (value == 2) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreatePostPage()));
            }
            index = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(index == 0 ? IconlyBold.home : IconlyLight.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              index == 1 ? IconlyBold.message : IconlyLight.message,
            ),
            label: 'Message',
          ),
          NavigationDestination(
            icon: Icon(
              index == 2
                  ? Icons.add_circle_rounded
                  : Icons.add_circle_outline_rounded,
            ),
            label: 'Create',
          ),
          NavigationDestination(
              icon: Icon(
                index == 3 ? IconlyBold.wallet : IconlyLight.wallet,
              ),
              label: 'Money'),
          NavigationDestination(
              icon: Icon(
                index == 4 ? IconlyBold.profile : IconlyLight.profile,
              ),
              label: 'Profile'),
        ],
      ),
      // drawer: index == 0 ? const Drawer(child: Text('Drawer Content')) : null,
    );
  }
}

class HomePage extends StatefulWidget {
  final AuthUserModel user;
 
  const HomePage({ required this.user, super.key});

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
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.density_medium),
            ),
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
                      // const PostedContent(
                      //   service: 'Remote',
                      //   title: 'Timeless beauty of moments captured',
                      //   image: MyAppImages.testOne,
                      // ),
                      SizedBox(height: 30.h),
                      const CategoryTitleWidget(
                        title: "Latest Offerings",
                      ),
                      SizedBox(height: 20.h),
                      // const PostedContent(
                      //   service: 'Local',
                      //   title: 'Timeless beauty of moments captured',
                      //   image: MyAppImages.testOne,
                      // ),
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
