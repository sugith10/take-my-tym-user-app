import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/assets/app_svg.dart';

import '../../../../../core/model/app_user_model.dart';
import '../../../../../core/utils/text_manipulator/taxt_manipulator.dart';
import '../../../../../core/widgets/circle_profile_picture_widget.dart';
import 'widgets/profile_location_widget.dart';

class ProfileCard extends StatelessWidget {
  final UserModel userModel;
  const ProfileCard({
    required this.userModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Section 1 begin
          const CircleProfilePicWidget(
            height: 100,
            width: 100,
          ),
          SizedBox(width: 15.h),
          //Section 1 end

          //Section 2 begin
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //User full name
                  FittedBox(
                    child: Row(
                      children: [
                        _ProfileNameWidget(
                            name:
                                '${TextManipulator.capitalize(userModel.firstName)} ${TextManipulator.capitalize(userModel.lastName)}'),
                        SizedBox(width: 8.w),
                        if (userModel.verified)
                          SvgPicture.asset(AppSvg.verified,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xFF1D9AEF), BlendMode.srcIn))
                      ],
                    ),
                  ),
                  if (!userModel.verified)
                    Text("(Verification Pending)",
                        style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5.h),
                  //username
                  Text("@${userModel.userName.toLowerCase()}"),
                  SizedBox(height: 5.h),
                  const Divider(),
                  //location
                  ProfileInfoWidget(
                      icon: IconlyLight.location, text: userModel.location),
                  SizedBox(height: 5.h),
                  ProfileInfoWidget(
                      icon: IconlyBroken.calendar,
                      text: "Joined ${userModel.join}"),
                  //location end
                ],
              ),
            ),
          ),
          //Section 2 begin
        ],
      ),
    );
  }
}

class _ProfileNameWidget extends StatelessWidget {
  final String name;
  const _ProfileNameWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context)
          .textTheme
          .displayMedium
          ?.copyWith(fontWeight: FontWeight.w900, fontSize: 25),
      overflow: TextOverflow.fade,
      maxLines: 2,
    );
  }
}
