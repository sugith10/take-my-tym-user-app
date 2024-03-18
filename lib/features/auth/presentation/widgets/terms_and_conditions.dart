import 'package:flutter/material.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/core/widgets/navigation_taxt_button.dart';


class TermsAndConditons extends StatelessWidget {
  const TermsAndConditons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationText(
          leadingText: "By proceeding, I accept TakeMyTym's",
          buttonText: 'T&C',
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          },
        ),
        NavigationText(
          leadingText: "and",
          buttonText: 'Privacy Policy.',
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
