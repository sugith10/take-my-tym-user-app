import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/theme/color/app_colors.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/const/app_padding.dart';
import 'package:take_my_tym/core/const/app_radius.dart';
import 'package:take_my_tym/core/widgets/app_snackbar/app_snack_bar.dart';
import 'package:take_my_tym/core/widgets/skills_widget/bloc/create_skill_bloc/create_skill_bloc.dart';
import 'package:take_my_tym/features/create_post/presentation/widget/create_post_title_widget.dart';

class CollectItemsWidget extends StatefulWidget {
  final CreateSkillBloc createSkillBloc;
  const CollectItemsWidget({
    required this.createSkillBloc,
    super.key,
  });

  @override
  State<CollectItemsWidget> createState() => _CollectItemsWidgetState();
}

class _CollectItemsWidgetState extends State<CollectItemsWidget> {
  final TextEditingController _categoryCntrl = TextEditingController();
  final AppAlert _errorMsg = AppAlert(
      alert: "Skill limit reached",
      details: "You have reached the maximum number of skills allowed.");
  Set<String> skills = {};
  @override
  void dispose() {
    _categoryCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.createSkillBloc.add(AddAllSkillEvent(skill: skills));
    return Column(
      children: [
        CreatePostTitleWidget(
          title: "Skills and Expertise",
          children: [
            SizedBox(height: 10.h),
            _SkillsTextField(
              categoryCntrl: _categoryCntrl,
              callback: () {
                final state = widget.createSkillBloc.state;
                if (state is UpdateSkillSuccessState) {
                  if (state.skills.length >= 5) {
                    AppSnackBar.failSnackBar(
                        context: context, alert: _errorMsg);
                  } else {
                    widget.createSkillBloc.add(
                      AddSkillEvent(
                        skill: _categoryCntrl.text,
                      ),
                    );
                  }
                } else {
                  widget.createSkillBloc.add(
                    AddSkillEvent(
                      skill: _categoryCntrl.text,
                    ),
                  );
                }

                _categoryCntrl.clear();
              },
            ),
            _SkillsWidget(
              createSkillBloc: widget.createSkillBloc,
            ),
          ],
        ),
      ],
    );
  }
}

class _SkillsTextField extends StatelessWidget {
  final VoidCallback callback;
  final TextEditingController categoryCntrl;

  const _SkillsTextField({
    required this.callback,
    required this.categoryCntrl,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      controller: categoryCntrl,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.borderRadius - 2),
          borderSide: BorderSide(color: AppDarkColor.instance.boxShadow),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.borderRadius - 2),
          borderSide: BorderSide(color: AppDarkColor.instance.boxShadow),
        ),
        hintText: "Skills",
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        suffixIcon: IconButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            callback();
          },
          icon: const Icon(Icons.add),
        ),
        suffixIconColor: AppDarkColor.instance.primaryText,
      ),
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}

class _SkillsWidget extends StatelessWidget {
  final CreateSkillBloc createSkillBloc;
  const _SkillsWidget({required this.createSkillBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: createSkillBloc,
      builder: (context, state) {
        if (state is UpdateSkillSuccessState) {
          return Column(
            children: [
              SizedBox(height: 10.h),
              Wrap(
                spacing: AppPading.homePadding,
                children: List.generate(
                  state.skills.length,
                  (index) {
                    final String skill = state.skills[index];
                    return Chip(
                      label: Text(
                        skill,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppDarkColor.instance.primaryTextSoft),
                      ),
                      shape: const StadiumBorder(side: BorderSide(width: 0.5)),
                      side: BorderSide(
                        color: AppDarkColor.instance.primarySoftBorder,
                      ),
                      onDeleted: () {
                        createSkillBloc.add(RemoveSkillEvent(
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
        if (state is CreateSkillInitial) {
          return const SizedBox(
            height: 70,
            child: Center(
              child: Text("Please add at least one item to the section"),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
