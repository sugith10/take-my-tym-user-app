import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/theme/color/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/search/presentation/bloc/search_bloc/search_bloc.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchEditingController;
  final SearchPostsBloc searchBloc;

  const SearchTextField({
    required this.searchEditingController,
    required this.searchBloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MyAppPadding.homePadding),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: searchEditingController,
        onChanged: (value) {
          searchBloc.add(SearchBuyTymPost(searchQuery: value));
        },
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: AppDarkColor.instance.primaryText,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                searchEditingController.clear();
                searchBloc.add(ClearSearchEvent());
              },
              child: Icon(
                Icons.clear_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                IconlyLight.arrow_left,
                color: Colors.white,
              ),
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
