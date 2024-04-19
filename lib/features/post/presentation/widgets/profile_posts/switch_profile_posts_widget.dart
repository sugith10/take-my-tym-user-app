import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/post/presentation/bloc/read_post_bloc/read_post_bloc.dart';

class SwitchProfilePostsWidget extends StatefulWidget {
  const SwitchProfilePostsWidget({
    super.key,
  });

  @override
  State<SwitchProfilePostsWidget> createState() =>
      _SwitchProfilePostsWidgetState();
}

class _SwitchProfilePostsWidgetState extends State<SwitchProfilePostsWidget> {
  bool type = true;

  @override
  Widget build(BuildContext context) {
    void getCategory(bool value) {
      value ? type = true : type = false;

      type
          ? context.read<ReadPostsBloc>().add(
                GetBuyTymPostsEvent(
                    userId: context.read<AppUserBloc>().appUserModel!.uid),
              )
          : context.read<ReadPostsBloc>().add(GetSellTymPostsEvent(
              userId: context.read<AppUserBloc>().appUserModel!.uid));
    }

    return HomePadding(
      child: BlocBuilder<ReadPostsBloc, ReadPostsState>(
        builder: (context, state) {
          log(state.toString());
          if (state is GotSellTymPostsState) {
            return SwitchCategoryWidget(
              getTymType: getCategory,
              tymType: false,
            );
          }
          return SwitchCategoryWidget(
            getTymType: getCategory,
            tymType: true,
          );
        },
      ),
    );
  }
}
