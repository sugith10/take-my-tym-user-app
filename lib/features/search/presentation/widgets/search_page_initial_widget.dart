import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/assets/app_lottie.dart';

class SearchInitial extends StatelessWidget {
  final String message;
  const SearchInitial({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          AppLottie.search,
          repeat: false,
        ),
        const SizedBox(height: 20),
        Text(
          '"$message"',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
