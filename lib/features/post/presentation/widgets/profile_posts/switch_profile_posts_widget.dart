import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';
import 'package:take_my_tym/features/post/presentation/bloc/user_post_bloc/user_post_bloc.dart';

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

      if (type) {
        log(value.toString());
        log("true");
      } else {
        log(value.toString());
        log("false");
      }

      type
          ? context.read<UserPostBloc>().add(GetBuyTymPostsEvent())
          : context.read<UserPostBloc>().add(GetSellTymPostsEvent());
    }

    return HomePadding(
      child: SwitchCategoryWidget(getCategory: getCategory),
    );
  }
}
