import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';
import 'package:take_my_tym/features/home/presentation/widgets/category_title_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/home_page_app_bar.dart';
import 'package:take_my_tym/features/home/presentation/widgets/home_page_filter_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/generate_feed_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/home_page_shimmer_effect.dart';
import 'package:take_my_tym/features/home/presentation/widgets/welcome_user_widget.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/post/presentation/pages/view_post_page.dart';

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
                  height: 10.h,
                ),
                const HomePageFilterWidget(),
                SizedBox(height: 15.h),
                //Category One
                const CategoryTitleWidget(
                  title: "Look's Interesting",
                ),
                SizedBox(height: 20.h),
                const GenerateFeedWidget(
                  service: 'Remote',
                  title: 'Timeless beauty of moments captured',
                  image: MyAppImages.testTwo,
                ),
                SizedBox(height: 20.h),
                // ShimmerEffectWidget(),
                //Category Two
                SingleChildScrollView(
                  child: BlocBuilder<CommunityPostsBloc, CommunityPostsState>(
                    builder: (context, state) {
                      if (state is CommunityPostsLoadingState) {
                        return const HomePageShimmerEffect();
                      }
                      if (state is CommunityPostsSuccessState) {
                        log("its successssssss");
                        return HomePadding(
                          child: Column(
                            children: List.generate(state.buyTymPosts.length,
                                (index) {
                              final PostModel postModel =
                                  state.buyTymPosts[index];
                              return PostedContentWidget(
                                voidCallback: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ViewPostPage(postModel: postModel),
                                    ),
                                  );
                                },
                                postModel: postModel,
                                width: double.infinity,
                              );
                            }),
                          ),
                        );
                      }
                      return const HomePageShimmerEffect();
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
