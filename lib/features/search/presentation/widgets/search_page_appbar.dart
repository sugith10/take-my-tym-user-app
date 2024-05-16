import 'package:flutter/material.dart';

import '../bloc/search_bloc/search_bloc.dart';
import 'search_text_field.dart';

class SearchPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController searchEditingController;
  final SearchPostsBloc bloc;

  const SearchPageAppBar({
    super.key,
    required this.searchEditingController,
    required this.bloc,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  State<StatefulWidget> createState() => _SearchPageAppBarState();
}

class _SearchPageAppBarState extends State<SearchPageAppBar> {
  bool tymType = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: SearchTextField(
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
          //     borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
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
