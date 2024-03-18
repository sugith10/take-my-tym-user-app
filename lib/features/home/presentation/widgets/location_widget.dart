import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/image_icon.dart';

class LocationWidget extends StatelessWidget {
  final Function function;
  const LocationWidget({
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          function();
        },
        icon: Row(
          children: [
            const SizedBox(
                child: CoustomImageIcon(
              image: MyAppImages.locationIcon,
              height: 28,
              width: 28,
            )),
            SizedBox(width: 10.sp),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Calicut",
                      style: Theme.of(context).textTheme.labelMedium),
                  Text(
                    "Kerala, Indaia",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 11.sp),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5.sp),
            const SizedBox(child: Icon(IconlyLight.arrow_down_2)),
          ],
        ));
  }
}
