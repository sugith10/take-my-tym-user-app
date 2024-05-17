import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/constrain_text_form_field.dart';

class RemunerationWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextStyle? style;

  const RemunerationWidget({
    required this.controller,
    required this.style,
    super.key,
  });

  @override
  State<RemunerationWidget> createState() => _RemunerationWidgetState();
}

class _RemunerationWidgetState extends State<RemunerationWidget> {
  double currentValue = 500;

  @override
  void initState() {
    super.initState();
    widget.controller.text = currentValue.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectInfoTextField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          hintText: "Remuneration",
          style: widget.style,
          controllerStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(letterSpacing: 1),
          prefixIcon: Icon(
            Icons.currency_rupee_rounded,
            color: AppDarkColor.instance.primaryTextSoft,
          ),
        ),
        SizedBox(height: 5.h),
        Slider(
          activeColor: AppDarkColor.instance.success,
          value: currentValue,
          min: 500,
          max: 50000,
          
          onChanged: (value) {
            setState(
              () {
                currentValue = value;
                widget.controller.text = value.toInt().toString();
              },
            );
          },
        ),
      ],
    );
  }
}
