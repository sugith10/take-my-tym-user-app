import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/assets/app_lottie.dart';
import '../../../../core/widgets/not_yet_widget.dart';

class NoMessageWidget extends StatelessWidget {
  final String message; 
  const NoMessageWidget({
    this.message = "No messages yet",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        Lottie.asset(AppLottie.message),
        NotYetWidget(
          title: message,
          subtitle: "You'll find your conversations all right here.",
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
