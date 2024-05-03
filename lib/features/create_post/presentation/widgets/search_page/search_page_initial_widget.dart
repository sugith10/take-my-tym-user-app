import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_assets/app_lottie.dart';

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
          Lottie.asset(AppLottie.search),
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
