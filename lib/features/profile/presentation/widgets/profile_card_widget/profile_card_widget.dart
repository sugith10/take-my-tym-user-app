import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_card_widget/widgets/profile_location_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_card_widget/widgets/rating_widget.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserModel userModel =   context.read<AppUserBloc>().userModel!;
    return SizedBox(
      height: 200,
      child: HomePadding(
        child: Row(
          children: [
            SizedBox(width: 15.h),
            //Section 1 begin
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   ProfileNameWidget(name: userModel.userName),
                  SizedBox(height: 10.h),

                  const RatingWidget(
                    firstStar: true,
                    secondStar: true,
                    thirdStar: true,
                    fourthStar: true,
                    fifthStar: true,
                  ),
                  SizedBox(height: 10.h),
                  //location start

                   ProfileLocationWidget(
                    location: userModel.location,
                  ),
                  //location end
                ],
              ),
            ),
            //Section 1 ends
            const Spacer(),
            //Section 2 begin
            const CircleProfilePicWidget(
              height: 100,
              width: 100,
            ),

            //Section 2 ends
            SizedBox(width: 20.h),
          ],
        ),
      ),
    );
  }
}

class ProfileNameWidget extends StatelessWidget {
  final String name;
  const ProfileNameWidget({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.displayMedium,
      overflow: TextOverflow.fade,
      maxLines: 2,
    );
  }
}
