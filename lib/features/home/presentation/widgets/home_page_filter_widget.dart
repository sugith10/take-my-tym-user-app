import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/home/presentation/bloc/community_posts_bloc/community_posts_bloc.dart';
import 'package:take_my_tym/features/home/presentation/widgets/search_button.dart';
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
            const HomePostSwitch(),
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

class HomePostSwitch extends StatefulWidget {
  const HomePostSwitch({super.key});

  @override
  State<HomePostSwitch> createState() => _HomePostSwitchState();
}

class _HomePostSwitchState extends State<HomePostSwitch> {
  bool _type = true;

  @override
  Widget build(BuildContext context) {
    void getCategory(bool tymType) {
      tymType ? _type = true : _type = false;

      _type
          ? context.read<CommunityPostsBloc>().add(
                (BuyTymCommunityPostsEvent()),
              )
          : context.read<CommunityPostsBloc>().add(SellTymCommunityPostsEvent());
    }

    return SwitchCategoryWidget(
      getTymType: getCategory,
    );
  }
}
