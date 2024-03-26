import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(MyAppPadding.homePadding),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _searchEditingController,
                autofocus: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      log('sufix');
                    },
                    child: Icon(
                      Icons.clear_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  prefixIcon: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      IconlyLight.arrow_left,
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(237, 53, 53, 53).withOpacity(0.5),
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                ),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
