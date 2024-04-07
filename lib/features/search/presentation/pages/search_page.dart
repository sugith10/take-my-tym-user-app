import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/features/post/presentation/pages/view_post_page.dart';
import 'package:take_my_tym/features/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:take_my_tym/features/post/presentation/widgets/search_page/search_page_initial_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/search_text_field.dart';

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
          child: Row(
            children: [
              Expanded(
                child: SearchTextField(
                  searchEditingController: _searchEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(MyAppRadius.borderRadius),
                        border: Border.all(
                            color: MyAppDarkColor().primarySoftBorder)),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        IconlyLight.filter,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: HomePadding(
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
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final postModel = state.results[index];
                      return PostedContentWidget(
                        postModel: postModel,
                        voidCallback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ViewPostPage(postModel: postModel),
                            ),
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
      // floatingActionButton: const HomePostSwitch(),
    );
  }
}

Future _showBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => AuthPadding(
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'Select Post Type',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: Row(
                    children: [
                      _BottomSheetButton(
                        tymType: "BuyTym Posts",
                      ),
                      SizedBox(width: 15),
                      _BottomSheetButton(tymType: "SellTym Posts"),
                    ],
                  ),
                ),
              ],
            ),
          ));
}

class _BottomSheetButton extends StatelessWidget {
  final String tymType;
  const _BottomSheetButton({required this.tymType});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          tymType,
        ),
      ),
    );
  }
}
