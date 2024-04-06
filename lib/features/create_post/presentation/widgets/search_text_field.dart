import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/create_post/presentation/bloc/search_bloc/search_bloc.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchEditingController;

  const SearchTextField({
    required this.searchEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchPostsBloc>();
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
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
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
          fillColor: const Color.fromARGB(237, 53, 53, 53).withOpacity(0.5),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.labelLarge,
        ),
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
