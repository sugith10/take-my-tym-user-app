import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/shimmer_effect.dart';
import 'package:take_my_tym/features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';
import 'package:take_my_tym/features/home/presentation/widgets/all_commune_posts_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/banner_widget.dart';
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
                  height: 10.h
                ),
                const HomePageFilterWidget(),
                SizedBox(height: 20.h),
                const BannerWidget(),
                // SizedBox(height: 35.h),
                // const CategoryTitleWidget(
                //   title: "Nearby Offers",
                // ),
                SizedBox(height: 20.h),
                // BlocBuilder<NearbyPostsBloc, NearbyPostsState>(
                //     builder: (context, state) {
                //   if (state is NearbyPostsResult) {
                //     return GenerateFeedWidget(
                //       posts: state.posts,
                //     );
                //   }
                //   return const CircularProgressIndicator();
                // }),
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
                            const CategoryTitleWidget(
                              title: "Remote Offers",
                            ),
                            SizedBox(height: 20.h),
                            GenerateFeedWidget(
                              posts: state.remotePosts,
                            ),
                            SizedBox(height: 20.h),
                            const CategoryTitleWidget(
                              title: "Onsite Offers",
                            ),
                            SizedBox(height: 20.h),
                            GenerateFeedWidget(
                              posts: state.onsitePosts,
                            ),
                            SizedBox(height: 20.h),
                            const CategoryTitleWidget(
                              title: "Grab it now...",
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
