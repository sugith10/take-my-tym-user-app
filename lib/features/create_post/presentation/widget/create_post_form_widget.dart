import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color/app_colors.dart';
import '../../../location/presentation/bloc/location_bloc.dart';
import 'create_post_location_widget.dart';
import 'create_post_title_widget.dart';
import 'experience_widget.dart';
import 'remuneration_text_field.dart';

class CreatePostFormWidget extends StatelessWidget {
  const CreatePostFormWidget({
    super.key,
    required this.locationBloc,
    required this.experienceCntrl,
    required this.remunerationCntrl,
  });

  final LocationBloc locationBloc;

  final TextEditingController experienceCntrl;
  final TextEditingController remunerationCntrl;

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context)
        .textTheme
        .labelLarge
        ?.copyWith(color: AppDarkColor.instance.primaryTextSoft);
    return CreatePostTitleWidget(
      title: "Relevant Details",
      children: [
        SizedBox(height: 20.h),
        CreatePostLocationWidget(
          locationBloc: locationBloc,
          style: style,
          gap: 12.5.h,
        ),
        SizedBox(height: 20.h),
        ExperienceWidget(
          controller: experienceCntrl,
          gap: 12.5.h,
          style: style,
        ),
        SizedBox(height: 20.h),
        RemunerationWidget(
          style: style,
          controller: remunerationCntrl,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
