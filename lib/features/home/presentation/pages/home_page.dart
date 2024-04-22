import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/shimmer_effect.dart';
import 'package:take_my_tym/features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';
import 'package:take_my_tym/features/home/presentation/bloc/nearby_posts_bloc/nearby_posts_bloc.dart';
import 'package:take_my_tym/features/home/presentation/widgets/all_commune_posts_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/category_title_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/generate_feed_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/home_page_app_bar.dart';
import 'package:take_my_tym/features/home/presentation/widgets/home_page_filter_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/welcome_user_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Timer? _timer;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomePageAppBar(
            openDrawer: () => Scaffold.of(context).openDrawer(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20.h),
                const WelcomeUser(),
                SizedBox(
                  height: 10.h,
                ),
                const HomePageFilterWidget(),
                SizedBox(height: 20.h),
                const BannerWidget(),
                SizedBox(height: 35.h),
                const CategoryTitleWidget(
                  title: "Nearby Offers",
                ),
                SizedBox(height: 20.h),
                BlocBuilder<NearbyPostsBloc, NearbyPostsState>(
                    builder: (context, state) {
                  if (state is NearbyPostsResult) {
                    return GenerateFeedWidget(
                      posts: state.posts,
                    );
                  }
                  return const CircularProgressIndicator();
                }),
                SingleChildScrollView(
                  child: BlocBuilder<CommunityPostsBloc, CommunityPostsState>(
                    builder: (context, state) {
                      if (state is CommunityPostsLoadingState) {
                        return const ShimmerEffectWidget();
                      }
                      if (state is CommunityPostsSuccessState) {
                        return Column(
                          children: [
                            const CategoryTitleWidget(
                              title: "Latest Offers",
                            ),
                            SizedBox(height: 20.h),
                            GenerateFeedWidget(
                              posts: state.posts,
                            ),
                            SizedBox(height: 20.h),
                            AllCommunePostsWidget(
                              posts: state.posts,
                            ),
                          ],
                        );
                      }
                      return const ShimmerEffectWidget();
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceholder({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath!,
           fit: BoxFit.cover,
       
        ),
      ),
    );
  }
}

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final images = <String>[
    MyAppImages.adOne,
    MyAppImages.adTwo,
    MyAppImages.adThree,
    MyAppImages.adFour,
  ];

  late List<Widget> pages;

  int activePage = 0;

  final PageController pageController = PageController(initialPage: 0);

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.page == images.length - 1) {
        pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    pages = List.generate(
      images.length,
      (index) => ImagePlaceholder(imagePath: images[index]),
    );
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 6,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return pages[index];
            },
            onPageChanged: (value) {
              setState(() {
                activePage = value;
              });
            },
          ),
        ),
        //code for page indicator
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  pages.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: activePage == index
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 128, 128, 128),
                          ),
                        ),
                      )),
            ),
          ),
        )
      ],
    );
  }
}
