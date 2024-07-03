import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/const/app_padding.dart';
import '../../../../core/const/app_radius.dart';
import '../../../create_post/presentation/widget/post_category_widget.dart';



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
          spacing: AppPading.homePadding,
          runSpacing: AppPading.homePadding,
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
          Radius.circular(AppRadius.borderRound),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(skill),
      ),
    );
  }
}
