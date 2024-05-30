import 'package:flutter/material.dart';

import '../../../../../core/utils/app_debouncer.dart';
import '../../bloc/search_bloc/search_bloc.dart';
import 'search_text_field.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController searchEditingController;
  final SearchPostsBloc bloc;
  final Debouncer debouncer;

  const SearchAppBar({
    required this.debouncer,
    required this.searchEditingController,
    required this.bloc,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  State<StatefulWidget> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool tymType = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: SearchTextField(
              debouncer: widget.debouncer,
              searchBloc: widget.bloc,
              searchEditingController: widget.searchEditingController,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 5),
          //   child: InkWell(
          //     onTap: () {
          //       _showBottomSheet(context, widget.bloc);
          //     },
          //     borderRadius: BorderRadius.circular(AppRadius.borderRadius),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(AppRadius.borderRadius),
          //         border: Border.all(
          //           color: AppDarkColor.instance.primarySoftBorder,
          //         ),
          //       ),
          //       child: const Padding(
          //         padding: EdgeInsets.all(15),
          //         child: Icon(
          //           IconlyLight.filter,
          //           size: 28,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  // void _showBottomSheet(BuildContext context, SearchPostsBloc bloc) {
  //   AppBottomSheet.show(
  //     context: context,
  //     children: [
  //       Text(
  //         'Select Post Type',
  //         style: Theme.of(context).textTheme.headlineSmall,
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(top: 20, bottom: 30),
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: RadioListTile<bool>(
  //                 activeColor: Colors.white,
  //                 title: Text(
  //                   'BuyTymPost',
  //                   style: Theme.of(context).textTheme.labelSmall,
  //                 ),
  //                 value: true,
  //                 groupValue: tymType,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     tymType = value!;
  //                     bloc.tymType = tymType;
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //             ),
  //             Expanded(
  //               child: RadioListTile<bool>(
  //                 activeColor: Colors.white,
  //                 title: Text(
  //                   'SellTymPost',
  //                   style: Theme.of(context).textTheme.labelSmall,
  //                 ),
  //                 value: false,
  //                 groupValue: tymType,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     tymType = value!;
  //                     bloc.tymType = tymType;
  //                   });
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
