import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String dropdownValue = "Remote";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
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

              SizedBox(
                child: CupertinoContextMenu(
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.white,
                  ),
                  actions: <Widget>[
                    CupertinoContextMenuAction(child: const Text('Remote'), onPressed: (){
                      log('remote');
                    },),
                     CupertinoContextMenuAction(child: const Text('Local'), onPressed: () {
                       log('local');
                     },),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
