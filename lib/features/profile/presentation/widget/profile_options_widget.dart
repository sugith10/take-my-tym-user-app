import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/const/app_radius.dart';
import '../../../../core/theme/color/app_colors.dart';

class ProfileOptionsWidget extends StatelessWidget {
  final VoidCallback editProfile;
  const ProfileOptionsWidget({
    required this.editProfile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          _ProfileOptionButton(
            action: 'Edit Profile',
            callback: () {
              editProfile();
            },
          ),
          const Spacer(),
          _ProfileOptionButton(
            action: 'Share Profile',
            callback: () {},
          ),
          const Spacer(),
          _ProfileOptionButton(
            action: 'Bookmark',
            callback: () {},
          )
        ],
      ),
    );
  }
}

class _ProfileOptionButton extends StatelessWidget {
  final VoidCallback callback;
  final String action;
  const _ProfileOptionButton({
    required this.action,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.borderRadius - 5),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            action,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppDarkColor.instance.primaryTextSoft,
                ),
          ),
        ),
      ),
    );
  }
}
