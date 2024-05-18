import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/assets/app_lottie.dart';
import '../../../../core/widgets/not_yet_widget.dart';

class NoMessageWidget extends StatelessWidget {
  const NoMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        Lottie.asset(AppLottie.message),
        const NotYetWidget(
          title: "No messages yet",
          subtitle: "You'll find your conversations all right here.",
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
