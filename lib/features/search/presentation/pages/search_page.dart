import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/route/route_name/app_route_name.dart';

import '../../../../core/utils/app_debouncer.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/post_card.dart';
import '../widgets/search_empty_list_widget.dart';
import '../widgets/search_page_initial_widget.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../widgets/seach_appbar/search_page_appbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchPostsBloc searchBloc = SearchPostsBloc();

  final _debouncer = Debouncer(milliseconds: 500);

  final TextEditingController _searchEditingController =
      TextEditingController();

  final String _message =
      "In the gig economy, anyone can find their place. It's a marketplace of skills, creativity, and opportunity.";

  @override
  void dispose() {
    _searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        debouncer: _debouncer,
        searchEditingController: _searchEditingController,
        bloc: searchBloc,
      ),
      body: SafeArea(
        child: HomePadding(
          child: BlocBuilder(
            bloc: searchBloc,
            builder: (context, state) {
              if (state is SearchPostsInitial) {
                return SearchInitial(message: _message);
              }
              if (state is SearchPostsErrorState) {
                return const Text("Sorry, something went wrong");
              }
              if (state is SearchPostsEmptyState) {
                return const EmptyListWidget(
                  message: "Result not found...",
                );
              }
              if (state is SearchPostsResultState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final postModel = state.results[index];
                      return PostCard(
                        postModel: postModel,
                        voidCallback: () {
                          Navigator.pushNamed(context, RouteName.viewPost,
                              arguments: postModel);
                        },
                        width: double.infinity,
                      );
                    },
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator.adaptive());
            },
          ),
        ),
      ),
    );
  }
}
