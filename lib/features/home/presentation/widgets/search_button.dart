import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback callback;
  const SearchButton({
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        callback();
      },
      icon: CircleAvatar(
        radius: 20.h,
        backgroundColor:
         const   Color.fromARGB(255, 40, 40, 40),
        child: const Icon(IconlyLight.search),
      ),
    );
  }
}
