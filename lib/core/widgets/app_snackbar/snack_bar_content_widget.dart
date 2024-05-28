part of 'app_snack_bar.dart';

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
            borderRadius: BorderRadius.all(
              Radius.circular(
                Platform.isIOS
                    ? AppRadius.borderRadius + AppRadius.borderRadius
                    : AppRadius.borderRadius,
              ),
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
                    FittedBox(
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppDarkColor.instance.primaryTextBlur,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
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
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
              Platform.isIOS
                  ? AppRadius.borderRadius + AppRadius.borderRadius
                  : AppRadius.borderRadius,
            )),
            child: SvgPicture.asset(
              AppSvg.snackBarBubbles,
              height: 48,
              width: 40,
              colorFilter: ColorFilter.mode(
                assetColor,
                BlendMode.srcIn,
              ),
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
                AppSvg.snackBarIconSpace,
                height: 40,
                colorFilter: ColorFilter.mode(
                  assetColor,
                  BlendMode.srcIn,
                ),
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
