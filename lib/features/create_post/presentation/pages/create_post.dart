import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/bottom_navigation/navigation_menu.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String dropdownValue = "Remote";
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => NavigationMenu()));
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationMenu()));
            },
            icon: const Icon(IconlyLight.arrow_left),
          ),
          actions: [],
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: MyAppPadding.paddingTwo, left: MyAppPadding.paddingTwo),
            child: Column(
              children: [
                // DropdownButton<String>(
                //   value: dropdownValue,
                //   icon: Icon(IconlyLight.arrow_down_2),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //     });
                //   },
                //   items: const [
                //     DropdownMenuItem<String>(
                //       value: 'Remote',
                //       child: Text('Remote'),
                //     ),
                //      DropdownMenuItem<String>(
                //       value: 'Local',
                //       child: Text('Local'),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
