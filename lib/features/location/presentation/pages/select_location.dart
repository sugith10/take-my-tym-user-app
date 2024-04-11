import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';

class SelectLocationPage extends StatelessWidget {
  const SelectLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LocationPageAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(MyAppPadding.homePadding),
            child: TextField(
              keyboardType: TextInputType.text,
              // controller: searchEditingController,
              // onChanged: (value) {
              //   searchBloc.add(SearchBuyTymPost(searchQuery: value));
              // },
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              cursorColor: MyAppDarkColor().primaryText,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    IconlyLight.search,
                    color: Colors.white,
                  ),
                ),
                filled: true,
                fillColor: MyAppDarkColor().fillColor,
                hintText: 'Search for area...',
                hintStyle: Theme.of(context).textTheme.labelLarge,
              ),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const HomePadding(
              child: Divider(
            color: Colors.white24,
          )),
          Padding(
            padding: const EdgeInsets.all(MyAppPadding.homePadding),
            child: ElevatedButton(onPressed: (){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(IconlyLight.discovery),
                SizedBox(width: 10),
                Text("Use current location")
              ],
            ), style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(double.infinity,kToolbarHeight ))
            ),)
          )
        ],
      ),
    );
  }
}

class LocationPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const LocationPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyLight.arrow_down_2)),
      title: const Text("Select a location"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
