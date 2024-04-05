import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:take_my_tym/features/post/presentation/widgets/search_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchEditingController =
      TextEditingController();

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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: HomePadding(
                child: BlocBuilder<SearchPostsBloc, SearchPostsState>(
                  builder: (context, state) {
                    log(state.toString());
                    if (state is SearchPostsInitial) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset("asset/json/search_animation.json"),
                          const SizedBox(height: 20),
                          const Text(
                            "In the gig economy, anyone can find their place. It's a marketplace of skills, creativity, and opportunity.",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ));
                    }
                    if (state is SearchPostsErrorState) {}
                    if (state is SearchPostsResultState) {}
                    return const Column();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
