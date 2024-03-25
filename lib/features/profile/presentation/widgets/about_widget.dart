
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Hey there! I'm Sugith K, a 25-year-old Mobile App Developer from the bustling city of Mumbai. I’m all about bringing ideas to life through vibrant and meaningful designs. Creativity runs through my veins, and I'm committed to making every project a visual masterpiece.",
              style: Theme.of(context).textTheme.labelMedium,
              // maxLines: 5,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
