import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/features/home/presentation/pages/home_page.dart';
import 'package:take_my_tym/features/navigation_menu/navigation_menu.dart';

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
            context, MaterialPageRoute(builder: (_) => const NavigationMenu()));
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
          actions: [
            Container(
              color: const Color.fromARGB(255, 253, 59, 0),
              width: 100,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                right: MyAppPadding.paddingTwo, left: MyAppPadding.paddingTwo),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: Colors.yellow,
                    width: 100,
                    height: 20,
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Start typing here...'),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.abc),
              SizedBox(width: 10),
              Icon(Icons.emoji_emotions),
              Spacer(),
              IconButton(onPressed: () {}, icon: const Text("Post"))
            ],
          ),
        ),
      ),
    );
  }
}
