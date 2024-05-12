import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/posted_content.dart';
import '../widgets/search_page_initial_widget.dart';
import '../../../view_post/presentation/pages/view_post_page.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../widgets/search_page_appbar.dart';

class SearchPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SearchPage());
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchPostsBloc searchBloc = SearchPostsBloc();
  final TextEditingController _searchEditingController =
      TextEditingController();

  final String _message =
      "In the gig economy, anyone can find their place. It's a marketplace of skills, creativity, and opportunity.";

  @override
  void dispose() {
    _searchEditingController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchPageAppBar(
        searchEditingController: _searchEditingController,
        bloc: searchBloc,
      ),
      body: SafeArea(
        child: HomePadding(
          child: BlocBuilder(
            bloc: searchBloc,
            builder: (context, state) {
              if (state is SearchPostsInitial) {
                return SearchPostsInitialWidget(message: _message);
              }
              if (state is SearchPostsErrorState) {
                return const Text("No Data Found");
              }
              if (state is SearchPostsResultState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final postModel = state.results[index];
                      return PostedContentWidget(
                        postModel: postModel,
                        voidCallback: () {
                          Navigator.push(
                            context,
                            ViewPostPage.route(postModel: postModel),
                          );
                        },
                        width: double.infinity,
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
