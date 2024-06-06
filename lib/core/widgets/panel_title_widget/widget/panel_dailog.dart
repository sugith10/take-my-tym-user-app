part of '../panel_title_widget.dart';

class PanelSheet {
  PanelSheet._();
  static show({
    required BuildContext context,
    required String title,
    required String description,
    required String details,
  }) {
    AppBottomSheet.show(
      context: context,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 20.h),
        _deatailText(description, context),
        SizedBox(height: 12.h),
        _deatailText(details, context),
        SizedBox(height: 60.h),
      ],
    );
  }

  static Row _deatailText(String description, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.6),
          child: CircleAvatar(
            radius: 7,
            backgroundColor: AppDarkColor.instance.primaryTextSoft,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            children: [
              Text(description,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppDarkColor.instance.primaryTextSoft,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
