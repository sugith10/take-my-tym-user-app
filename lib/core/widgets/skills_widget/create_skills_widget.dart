import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/core/widgets/skills_widget/bloc/create_skill_bloc/create_skill_bloc.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_title_widget.dart';

class CreatePostSkillsWidget extends StatefulWidget {
  final CreateSkillBloc createSkillBloc;
  const CreatePostSkillsWidget({
    required this.createSkillBloc,
    super.key,
  });

  @override
  State<CreatePostSkillsWidget> createState() => _CreatePostSkillsWidgetState();
}

class _CreatePostSkillsWidgetState extends State<CreatePostSkillsWidget> {
  final TextEditingController _categoryCntrl = TextEditingController();
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
                    SnackBarMessenger().showSnackBar(
                      context: context,
                      errorMessage: "Exceeded the limit",
                      errorDescription:
                          "Only five items can be added in the skills section.",
                    );
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
      autofocus: true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      controller: categoryCntrl,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MyAppRadius.borderRadius - 2),
          borderSide: BorderSide(color: MyAppDarkColor.instance.boxShadow),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MyAppRadius.borderRadius - 2),
          borderSide: BorderSide(color: MyAppDarkColor.instance.boxShadow),
        ),
        hintText: "Skills",
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        suffixIcon: IconButton(
          onPressed: () {
            callback();
          },
          icon: const Icon(Icons.add),
        ),
        suffixIconColor: MyAppDarkColor.instance.primaryText,
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
                spacing: MyAppPadding.homePadding,
                children: List.generate(
                  state.skills.length,
                  (index) {
                    final String skill = state.skills[index];
                    return Chip(
                      label: Text(
                        skill,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: MyAppDarkColor.instance.primaryTextSoft),
                      ),
                      shape: const StadiumBorder(side: BorderSide(width: 0.5)),
                      side: BorderSide(
                        color: MyAppDarkColor.instance.primarySoftBorder,
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