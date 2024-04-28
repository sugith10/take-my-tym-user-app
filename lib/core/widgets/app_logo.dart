import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_assets.dart';
import 'package:take_my_tym/core/widgets/svg_image_widget.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [ 
        Text(
      "Where Time Meets Oppurtunity",
      style: Theme.of(context).textTheme.titleSmall,
    ),
    const SizedBox(height: 20),
    const SVGImageWidget(
      asset: MyAppImages.onboarding,
      height: 40,
    ),
    ],);
  }
}
