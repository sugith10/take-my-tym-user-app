import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/post_category_widget.dart';

class SkillsWidget extends StatelessWidget {
  final List<dynamic> skillList;
  const SkillsWidget({
    required this.skillList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              log(skillList.length.toString());
            },
            child: const PostCategoryTitle(title: 'Skills and Expertise')),
        SizedBox(height: 15.h),
        Wrap(
          spacing: MyAppPadding.homePadding,
          runSpacing: MyAppPadding.homePadding,
          children: List.generate(skillList.length, (index) {
            String skill = skillList[index];
            return _SkillTypeWidget(skill: skill);
          }),
        ),
      ],
    );
  }
}

class _SkillTypeWidget extends StatelessWidget {
  final String skill;
  const _SkillTypeWidget({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(139, 255, 255, 255),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(MyAppRadius.borderRound),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(skill),
      ),
    );
  }
}
