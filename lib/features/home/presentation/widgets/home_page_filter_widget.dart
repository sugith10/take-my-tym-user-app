import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';
import 'package:take_my_tym/features/search/presentation/pages/search_page.dart';

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
            const _HomePostSwitch(),
            SizedBox(width: 5.w),
            IconButton(
              onPressed: () {
                Navigator.push(context, SearchPage.route());
              },
              icon: CircleAvatar(
                radius: 20.h,
                backgroundColor: const Color.fromARGB(255, 40, 40, 40),
                child: const Icon(IconlyLight.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePostSwitch extends StatefulWidget {
  const _HomePostSwitch();

  @override
  State<_HomePostSwitch> createState() => __HomePostSwitchState();
}

class __HomePostSwitchState extends State<_HomePostSwitch> {
  late bool tymType;

  @override
  void initState() {
    super.initState();
    tymType = context.read<CommunityPostsBloc>().tymType;
  }

  @override
  Widget build(BuildContext context) {
    void getCategory(bool tymType) {
      tymType
          ? context.read<CommunityPostsBloc>().add(
                (BuyTymCommunityPostsEvent()),
              )
          : context
              .read<CommunityPostsBloc>()
              .add(SellTymCommunityPostsEvent());
    }

    return BlocBuilder<CommunityPostsBloc, CommunityPostsState>(
      builder: (context, state) {
        return SwitchCategoryWidget(
          getTymType: getCategory,
          tymType: tymType,
        );
      },
    );
  }
}
