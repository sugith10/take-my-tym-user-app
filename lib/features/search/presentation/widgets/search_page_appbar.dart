import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/search_text_field.dart';
import 'package:take_my_tym/features/search/presentation/bloc/search_bloc/search_bloc.dart';

class SearchPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController searchEditingController;

  const SearchPageAppBar({
    super.key,
    required this.searchEditingController,
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
              searchEditingController: widget.searchEditingController,
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
                  borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
                  border: Border.all(
                    color: MyAppDarkColor.instance.primarySoftBorder,
                  ),
                ),
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
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => AuthPadding(
        child: Wrap(
          alignment: WrapAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Select Post Type',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      activeColor: Colors.white,
                      title: Text(
                        'BuyTymPost',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      value: true,
                      groupValue: tymType,
                      onChanged: (value) {
                        setState(() {
                          tymType = value!;
                          context.read<SearchPostsBloc>().tymType = tymType;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      activeColor: Colors.white,
                      title: Text(
                        'SellTymPost',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      value: false,
                      groupValue: tymType,
                      onChanged: (value) {
                        setState(() {
                          tymType = value!;
                          context.read<SearchPostsBloc>().tymType = tymType;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
