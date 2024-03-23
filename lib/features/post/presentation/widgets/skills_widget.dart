import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/features/post/presentation/widgets/post_category_widget.dart';

  List<String> _skillList = [
    'Skills and Expertise',
    'Skills and Expertise',
    'Skills and Expertise',
    'Skills and Expertise',
    'Skills and Expertise',
  ];
class SkillsWidget extends StatelessWidget {

 const SkillsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PostCategoryTitle(title: 'Skills and Expertise'),
        SizedBox(height: 15.h),
        Wrap( 
          spacing: MyAppPadding.homePadding,
          runSpacing: MyAppPadding.homePadding,
          children: List.generate(_skillList.length, (index) => const _SkillTypeWidget(skill: 'Skills and Expertise'),),
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
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Mobile App Development'),
      ),
    );
  }
}
