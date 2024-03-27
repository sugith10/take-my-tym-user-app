import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class SnackBarContentWidget extends StatelessWidget {
  final String message;
  const SnackBarContentWidget({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: const BoxDecoration(
            color: Color(0xFFC72c41),
            borderRadius: BorderRadius.all(
              Radius.circular(MyAppRadius.borderRadius),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oh snap!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.labelSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(MyAppRadius.borderRadius)),
            child: SvgPicture.asset(
              MyAppImages.snackBarBubbles,
              height: 48,
              width: 40,
              color: const Color(0xFF801336),
            ),
          ),
        ),
        Positioned(
          top: -8,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                MyAppImages.snackBarFail,
                height: 40,
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  MyAppImages.snackBarClose,
                  height: 16,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
