import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/app_policy.dart';
import '../../../../core/widgets/navigation_taxt_button.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  final bool animate;
  const TermsAndConditionsWidget({
    this.animate = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: animate ? 800 : 0),
      duration: Duration(milliseconds: animate ? 900 : 0),
      child: Column(
        children: [
          NavigationText(
            leadingText: "By proceeding, I accept TakeMyTym's",
            buttonText: 'T&C',
            callback: () {
              AppPolicyUtil.launchConditions();
            },
          ),
          NavigationText(
            leadingText: "and",
            buttonText: 'Privacy Policy.',
            callback: () {
                AppPolicyUtil.launchPrivacyPolicy();
            },
          ),
        ],
      ),
    );
  }
}
