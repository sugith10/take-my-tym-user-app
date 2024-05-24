import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/theme/color/app_colors.dart';
import '../../../../core/utils/app_radius.dart';

class ExperienceWidget extends StatelessWidget {
  final TextStyle? style;
  final double gap;
  final TextEditingController controller;
  const ExperienceWidget({
    required this.controller,
    required this.style,
    required this.gap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? chosenModel = "Beginner";
    controller.text = chosenModel;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppRadius.borderRadius - 2,
      ),
      borderSide: BorderSide(color: AppDarkColor.instance.boxShadow),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Experience",
          style: style,
        ),
        SizedBox(height: gap),
        DropdownMenu(
          initialSelection: chosenModel,
          label: Text(
            "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          inputDecorationTheme: InputDecorationTheme(
            disabledBorder: border,
            enabledBorder: border,
          ),
          trailingIcon: Icon(
            IconlyBold.arrow_down_2,
            color: AppDarkColor.instance.secondaryText,
          ),
          selectedTrailingIcon: Icon(
            IconlyBold.arrow_up_2,
            color: AppDarkColor.instance.secondaryText,
          ),
          leadingIcon: Icon(
            IconlyLight.work,
            color: AppDarkColor.instance.iconColor,
          ),
          expandedInsets: const EdgeInsets.all(0),
          width: double.infinity,
          controller: SearchController(),
          textStyle: style,
          onSelected: (value) {
            chosenModel = value;
            controller.text = value!;
          },
          dropdownMenuEntries: [
            DropdownMenuEntry(value: chosenModel, label: "Beginner"),
            DropdownMenuEntry(value: chosenModel, label: "Intermediate"),
            DropdownMenuEntry(value: chosenModel, label: "Experienced")
          ],
        ),
      ],
    );
  }
}
