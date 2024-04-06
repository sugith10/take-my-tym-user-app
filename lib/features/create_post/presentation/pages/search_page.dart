import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/create_post/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/search_page/search_page_initial_widget.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/search_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: SearchTextField(
            searchEditingController: _searchEditingController,
          ),
        ),
      ),
      body: SafeArea(
        child:  HomePadding(
                child: BlocBuilder<SearchPostsBloc, SearchPostsState>(
                  builder: (context, state) {
                    log(state.toString());
                    if (state is SearchPostsInitial) {
                      return SearchPostsInitialWidget(message: _message);
                    }
                    if (state is SearchPostsErrorState) {
                      return const Text("No Data Found");
                    }
                    if (state is SearchPostsResultState) {
                      log(state.results.toString());
                     return ListView.builder(
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.results.length,
                          itemBuilder: (context, index) {
                            final result = state.results[index];
                            return Text(result.title);
                          });
                    
                    }
                    return const SizedBox();
                  },
                ),
              ),
      ),
    );
  }
}
