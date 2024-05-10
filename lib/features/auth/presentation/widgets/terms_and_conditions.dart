import 'package:flutter/material.dart';

import '../../../../core/widgets/navigation_taxt_button.dart';

class TermsAndConditons extends StatelessWidget {
  final int delay;
  final int duration;
  const TermsAndConditons({
    this.delay = 800,
    this.duration = 900,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationText(
          delay: delay,
          duration: duration,
          leadingText: "By proceeding, I accept TakeMyTym's",
          buttonText: 'T&C',
          function: () {
           //TODO: t&c
          },
        ),
        NavigationText(
          delay: delay,
          duration: duration,
          leadingText: "and",
          buttonText: 'Privacy Policy.',
          function: () {
           //TODO: t&c
          },
        ),
      ],
    );
  }
}
