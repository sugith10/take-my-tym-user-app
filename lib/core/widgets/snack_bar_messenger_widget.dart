import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        ),                        
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

class _SnackBarContentWidget extends StatelessWidget {
  final String message;
  final String description;
  const _SnackBarContentWidget({
    required this.message,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 100,
          decoration: const BoxDecoration(
            color: Color(0xFFC72c41),
            borderRadius: BorderRadius.all(
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
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontSize: 12.sp,
                          ),
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
              color: const Color(0xFF801336),
            ),          ),
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

