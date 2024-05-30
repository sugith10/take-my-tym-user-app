import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/constrain_text_form_field.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.firstNameCntrl,
    required this.style,
    required this.lastNameCntrl,
    required this.userNameCntrl,
    required this.aboutCntrl,
    required this.locationCntrl,
  });

  final TextEditingController firstNameCntrl;
  final TextStyle? style;
  final TextEditingController lastNameCntrl;
  final TextEditingController userNameCntrl;
  final TextEditingController aboutCntrl;
  final TextEditingController locationCntrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CollectInfoTextField(
                controller: firstNameCntrl,
                style: style,
                hintText: "First Name",
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.none,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: CollectInfoTextField(
                controller: lastNameCntrl,
                style: style,
                hintText: "Last Name",
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.none,
              ),
            ),
          ],
        ),
        SizedBox(height: 25.h),
        CollectInfoTextField(
          controller: userNameCntrl,
          style: style,
          hintText: "User Name",
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.none,
        ),
        SizedBox(height: 25.h),
        CollectInfoTextField(
          controller: aboutCntrl,
          style: style,
          hintText: "About",
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 25.h),
        CollectInfoTextField(
          controller: locationCntrl,
          style: style,
          hintText: "Location",
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
