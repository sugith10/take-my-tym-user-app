import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_assets.dart';

class SearchPostsInitialWidget extends StatelessWidget {
  final String message;
  const SearchPostsInitialWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(MyAppImages.searchIntialLottie),
          const SizedBox(height: 20),
          Text(
            '"$message"',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
