import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/app_svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Where Time Meets Oppurtunity",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 20),
        SvgPicture.asset(
          AppSvg.logo,
          height: 40,
        ),
      ],
    );
  }
}
