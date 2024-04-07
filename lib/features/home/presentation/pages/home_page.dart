import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';
import 'package:take_my_tym/features/home/presentation/widgets/category_title_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/location_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/generate_feed_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/search_button.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/home/presentation/widgets/welcome_user_widget.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/search/presentation/pages/search_page.dart';
import 'package:take_my_tym/features/create_post/presentation/pages/view_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getCategory(bool isSellCategory) {
    if (isSellCategory) {
      log("Category is Buy Tym");
    } else {
      log("Category is Sell Tym");
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
            ],
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
                SizedBox(height: 30.h),
                //Category Two
                SingleChildScrollView(
                  child: HomePadding(
                    child: BlocBuilder<CommunityPostsBloc, CommunityPostsState>(
                      builder: (context, state) {
                        if (state is CommunityPostsLoadingState) {
                          return const CircularProgressIndicator();
                        }
                        if (state is BuyTymCommunityPostsState) {
                          log("its successssssss");
                          return Column(
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
                          );
                        }
                        return const SizedBox();
                      },
                    ),
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

class HomePageFilterWidget extends StatelessWidget {
  const HomePageFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: MyAppPadding.homePadding),
        child: Row(
          children: [
            const CommunityPostSwitch(),
            SizedBox(width: 5.w),
            SearchButton(
              callback: () {
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
    );
  }
}

class CommunityPostSwitch extends StatefulWidget {
  const CommunityPostSwitch({super.key});

  @override
  State<CommunityPostSwitch> createState() => _CommunityPostSwitchState();
}

class _CommunityPostSwitchState extends State<CommunityPostSwitch> {
  bool _type = true;

  @override
  Widget build(BuildContext context) {
    void getCategory(bool value) {
      value ? _type = true : _type = false;

      _type
          ? context.read<CommunityPostsBloc>().add(
                (SellTymCommunityPostsEvent()),
              )
          : context.read<CommunityPostsBloc>().add(BuyTymCommunityPostsEvent());
    }

    return SwitchCategoryWidget(
      getTymType: getCategory,
    );
  }
}
