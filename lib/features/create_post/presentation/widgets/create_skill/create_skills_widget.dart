import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/create_post/presentation/bloc/create_skill_bloc/create_skill_bloc.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/create_post_title_widget.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/create_skill/create_skills_text_field.dart';

class CreatePostSkillsWidget extends StatefulWidget {
  final List<dynamic>? skills;
  const CreatePostSkillsWidget({
    required this.skills,
    super.key,
  });

  @override
  State<CreatePostSkillsWidget> createState() => _CreatePostSkillsWidgetState();
}

class _CreatePostSkillsWidgetState extends State<CreatePostSkillsWidget> {
  final TextEditingController _categoryCntrl = TextEditingController();
  final MyAppDarkColor _darkColor = MyAppDarkColor();

  @override
  void dispose() {
    _categoryCntrl.dispose();
    super.dispose();
  }
  //TODO -> ADD THE BLOCBUILDER AFTER THE TEXTFIELD

  @override
  Widget build(BuildContext context) {
    context.read<CreateSkillBloc>().add(AddAllSkillEvent(skill: widget.skills));
    return BlocBuilder<CreateSkillBloc, CreateSkillState>(
      builder: (context, state) {
        if (state is UpdateSkillSuccessState) {
          return CreatePostTitleWidget(
            title: "Skills and Expertise",
            children: [
              SizedBox(height: 10.h),
              SkillsTextField(
                categoryCntrl: _categoryCntrl,
                darkColor: _darkColor,
                callback: () {
                  if (state.skills.length >= 5) {
                    SnackBarMessenger().showSnackBar(
                      context: context,
                      errorMessage: "Exceeded the limit",
                      errorDescription:
                          "Only five items can be added in the skills section.",
                    );
                  } else {
                    context.read<CreateSkillBloc>().add(
                          AddSkillEvent(
                            skill: _categoryCntrl.text,
                          ),
                        );
                    log("check items");
                    log(context.read<CreateSkillBloc>().skills.toString());
                  }

                  _categoryCntrl.clear();
                },
              ),
              SkillsWidget(
                darkColor: _darkColor,
              ),
            ],
          );
        }
        return CreatePostTitleWidget(
          title: "Skills and Expertise",
          children: [
            SizedBox(height: 10.h),
            SkillsTextField(
                categoryCntrl: _categoryCntrl,
                darkColor: _darkColor,
                callback: () {
                  context
                      .read<CreateSkillBloc>()
                      .add(AddSkillEvent(skill: _categoryCntrl.text));
                  _categoryCntrl.clear();
                }),
            const SizedBox(
              height: 70,
              child: Center(
                child: Text("Please add at least one item to the section"),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SkillsWidget extends StatelessWidget {
  final MyAppDarkColor darkColor;

  const SkillsWidget({
    super.key,
    required this.darkColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSkillBloc, CreateSkillState>(
      builder: (context, state) {
        if (state is UpdateSkillSuccessState) {
          return Column(
            children: [
              SizedBox(height: 10.h),
              Wrap(
                spacing: MyAppPadding.homePadding,
                children: List.generate(
                  state.skills.length,
                  (index) {
                    final String skill = state.skills[index];
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
                        context.read<CreateSkillBloc>().add(RemoveSkillEvent(
                              skill: skill,
                            ));
                      },
                      clipBehavior: Clip.hardEdge,
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
