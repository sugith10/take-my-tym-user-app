import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/navigation_taxt_button.dart';


class TermsAndConditons extends StatelessWidget {
  final int delay;
  const TermsAndConditons({
    this.delay = 800,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationText(
          delay: delay,
          leadingText: "By proceeding, I accept TakeMyTym's",
          buttonText: 'T&C',
          function: () {
           //TODO: t&c
          },
        ),
        NavigationText(
          delay: delay,
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
