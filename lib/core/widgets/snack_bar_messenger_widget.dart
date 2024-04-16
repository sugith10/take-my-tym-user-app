import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

final class SnackBarMessenger {
  showSnackBar({
    required BuildContext context,
    required String errorMessage,
    required String errorDescription,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _SnackBarContentWidget(
          message: errorMessage,
          description: errorDescription,
          backgroundColor: const Color(0xFFC72c41),
          assetColor: const Color(0xFF801336),
          icon: MyAppImages.snackBarFail,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  successSnackBar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _SnackBarContentWidget(
          message: title,
          description: message,
          backgroundColor: const Color(0xff2D6A4F),
          assetColor: const Color.fromARGB(255, 31, 63, 49),
          icon: MyAppImages.snackBarSuccess,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class _SnackBarContentWidget extends StatelessWidget {
  final String message;
  final String description;
  final Color backgroundColor;
  final Color assetColor;
  final String icon;
  const _SnackBarContentWidget({
    required this.message,
    required this.description,
    required this.backgroundColor,
    required this.assetColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          height: 80,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(MyAppRadius.borderRadius),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: MyAppDarkColor.instance.primaryTextBlur),
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
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(MyAppRadius.borderRadius)),
            child: SvgPicture.asset(
              MyAppImages.snackBarBubbles,
              height: 48,
              width: 40,
              // ignore: deprecated_member_use
              color: assetColor,
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
                 MyAppImages.snackBarIconSpace,
                height: 40,
                // ignore: deprecated_member_use
                color: assetColor,
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                 icon,
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
