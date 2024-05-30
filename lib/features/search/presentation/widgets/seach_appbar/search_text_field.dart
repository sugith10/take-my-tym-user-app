import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/const/app_radius.dart';
import 'package:take_my_tym/core/theme/color/app_colors.dart';
import 'package:take_my_tym/core/const/app_padding.dart';
import 'package:take_my_tym/features/search/presentation/bloc/search_bloc/search_bloc.dart';

import '../../../../../core/utils/app_debouncer.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchEditingController;
  final SearchPostsBloc searchBloc;
  final Debouncer debouncer;

  const SearchTextField({
    required this.debouncer,
    required this.searchEditingController,
    required this.searchBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPading.homePadding),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: searchEditingController,
        onChanged: (value) {
          debouncer
              .run(() => searchBloc.add(SearchBuyTymPost(searchQuery: value)));
        },
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: AppDarkColor.instance.primaryText,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.borderRadius),
            onTap: () {
              searchEditingController.clear();
              searchBloc.add(ClearSearchEvent());
            },
            child: Icon(
              Icons.clear_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          prefixIcon: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.borderRadius),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              IconlyLight.arrow_down_2,
              color: Colors.white,
            ),
          ),
          filled: true,
          fillColor: AppDarkColor.instance.fillColor,
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.labelLarge,
        ),
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
