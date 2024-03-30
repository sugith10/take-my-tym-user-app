import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class SkillsGenrateWidget extends StatelessWidget {
  final List<String> skillList;

  final MyAppDarkColor darkColor;
  const SkillsGenrateWidget({
    required this.skillList,
    required this.darkColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MyAppPadding.homePadding,
      children: List.generate(
        skillList.length,
        (index) {
          final String skill = skillList[index];
          return _SkillChip(
            skill: skill,
            darkColor: darkColor,
          );
        },
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String skill;
  final MyAppDarkColor darkColor;

  const _SkillChip({
    required this.skill,
    required this.darkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        skill,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: darkColor.primaryTextSoft),
      ),
      shape: const StadiumBorder(side: BorderSide(width: 0.5)),
      side: BorderSide(
        color: darkColor.primarySoftBorder,
      ),
      onDeleted: () {
        debugPrint('hello');
      },
      clipBehavior: Clip.hardEdge,
    );
  }
}
