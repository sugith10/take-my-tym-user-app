import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/show_loading_dialog.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_skill_bloc/create_skill_bloc.dart';
import 'package:take_my_tym/features/post/presentation/widgets/constraints_text_form_field.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_title_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_skill/create_skills_widget.dart';

class CreatePostSecondPage extends StatefulWidget {
  const CreatePostSecondPage({super.key});

  @override
  State<CreatePostSecondPage> createState() => _CreatePostSecondPageState();
}

class _CreatePostSecondPageState extends State<CreatePostSecondPage> {
  final TextEditingController _categoryCntrl = TextEditingController();
  final TextEditingController _locationCntrl = TextEditingController();
  final TextEditingController _experienceCntrl = TextEditingController();
  final TextEditingController _remunerationCntrl = TextEditingController();
  final MyAppDarkColor _darkColor = MyAppDarkColor();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _categoryCntrl.dispose();
    _locationCntrl.dispose();
    _experienceCntrl.dispose();
    _remunerationCntrl.dispose();
    _formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is CreatPostLoadingState) {
          ShowLoadingDialog().showLoadingIndicator(context);
        }
        if (state is SecondDataCollectFailState) {
          Navigator.pop(context);
          SnackBarMessenger().showSnackBar(
            context: context,
            errorMessage: state.message,
            errorDescription: state.description,
          );
        }
      
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButtonWidget(),
          actions: [
            ActionButton(
              voidCallback: () {
                if (_formKey.currentState!.validate()) {
                  final skills = context.read<CreateSkillBloc>().skills;

                  if (skills.isNotEmpty) {
                    context
                        .read<CreatePostBloc>()
                        .add(CollectSecondPageDataEvent(
                          experience: _experienceCntrl.text,
                          location: _locationCntrl.text,
                          remuneration: _remunerationCntrl.text,
                          skills: skills,
                        ));
                  } else {
                    SnackBarMessenger().showSnackBar(
                      context: context,
                      errorMessage: "Required Skills Missing",
                      errorDescription:
                          "Please add at least one item in the Skills and Expertise section.",
                    );
                  }
                }
              },
              action: 'Next',
            ),
          ],
        ),
        body: HomePadding(
            child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const CreatePostSkillsWidget(),
                  SizedBox(height: 10.h),
                  Form(
                    key: _formKey,
                    child: CreatePostTitleWidget(
                      title: "Constraints",
                      children: [
                        SizedBox(height: 10.h),
                        ConstraintsTextFormField(
                          controller: _locationCntrl,
                          keyboardType: TextInputType.streetAddress,
                          darkColor: _darkColor,
                          hintText: 'Location',
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h),
                        ConstraintsTextFormField(
                          darkColor: _darkColor,
                          controller: _experienceCntrl,
                          keyboardType: TextInputType.text,
                          hintText: "Experience",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h),
                        ConstraintsTextFormField(
                          darkColor: _darkColor,
                          controller: _remunerationCntrl,
                          keyboardType: TextInputType.number,
                          hintText: "Remuneration",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
