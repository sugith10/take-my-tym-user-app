import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/navigation_taxt_button.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationText(
          leadingText: "By proceeding, I accept TakeMyTym's",
          buttonText: 'T&C',
          function: () {},
        ),
        NavigationText(
          leadingText: "and",
          buttonText: 'Privacy Policy.',
          function: () {},
        ),
      ],
    );
  }
}
