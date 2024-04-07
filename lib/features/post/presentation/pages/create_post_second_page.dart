import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/show_loading_dialog.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/post/presentation/bloc/read_post_bloc/read_post_bloc.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_skill_bloc/create_skill_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/update_post_bloc/update_post_bloc.dart';
import 'package:take_my_tym/core/widgets/constraints_text_form_field.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_title_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_skill/create_skills_widget.dart';

class CreatePostSecondPage extends StatefulWidget {
  final PostModel? postModel;
  const CreatePostSecondPage({this.postModel, super.key});

  @override
  State<CreatePostSecondPage> createState() => _CreatePostSecondPageState();
}

class _CreatePostSecondPageState extends State<CreatePostSecondPage> {
  final TextEditingController _categoryCntrl = TextEditingController();
  final TextEditingController _locationCntrl = TextEditingController();
  final TextEditingController _experienceCntrl = TextEditingController();
  final TextEditingController _remunerationCntrl = TextEditingController();
  List<dynamic>? skills;

  final MyAppDarkColor _darkColor = MyAppDarkColor();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.postModel != null) {
      _locationCntrl.text = widget.postModel!.location;
      _experienceCntrl.text = widget.postModel!.skillLevel;
      _remunerationCntrl.text = widget.postModel!.price.toString();
      skills = widget.postModel!.skills;
    }
  }

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
    return MultiBlocListener(
      listeners: [
        BlocListener<CreatePostBloc, CreatePostState>(
            listener: (context, state) {
          if (state is CreatPostLoadingState) {
            ShowLoadingDialog().showLoadingIndicator(context);
          }
          if (state is CreateSecondFailState) {
            Navigator.pop(context);
            SnackBarMessenger().showSnackBar(
              context: context,
              errorMessage: state.message,
              errorDescription: state.description,
            );
          }
          if (state is CreatePostSuccessState) {
              state.refreshType
                ? context
                    .read<ReadPostsBloc>()
                    .add(GetBuyTymPostsEvent(userId: state.uid))
                : context
                    .read<ReadPostsBloc>()
                    .add(GetSellTymPostsEvent(userId: state.uid));
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationMenu(),
              ),
              (route) => false,
            );
          }
        }),
        BlocListener<UpdatePostBloc, UpdatePostState>(
            listener: (context, state) {
          if (state is UpdatePostLoadingState) {
            ShowLoadingDialog().showLoadingIndicator(context);
          } else if (state is UpdatePostFailState) {
            Navigator.pop(context);
            SnackBarMessenger().showSnackBar(
              context: context,
              errorMessage: state.message,
              errorDescription: state.description,
            );
          } else if (state is UpdatePostSuccessState) {
            state.refreshType
                ? context
                    .read<ReadPostsBloc>()
                    .add(GetBuyTymPostsEvent(userId: state.uid))
                : context
                    .read<ReadPostsBloc>()
                    .add(GetSellTymPostsEvent(userId: state.uid));
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationMenu(),
              ),
              (route) => false,
            );
          }
        })
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButtonWidget(),
          actions: [
            ActionButton(
              callback: () {
                if (_formKey.currentState!.validate()) {
                  final skills = context.read<CreateSkillBloc>().skills;

                  if (skills.isNotEmpty) {
                    if (widget.postModel == null) {
                      context.read<CreatePostBloc>().add(
                            CreateSecondPageEvent(
                              experience: _experienceCntrl.text,
                              location: _locationCntrl.text,
                              remuneration: _remunerationCntrl.text,
                              skills: skills,
                            ),
                          );
                    } else {
                      context.read<UpdatePostBloc>().add(
                            UpdateSecondPageEvent(
                              experience: _experienceCntrl.text,
                              location: _locationCntrl.text,
                              remuneration: _remunerationCntrl.text,
                              skills: skills,
                            ),
                          );
                    }
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
                  CreatePostSkillsWidget(
                    skills: skills,
                  ),
                  SizedBox(height: 10.h),
                  Form(
                    key: _formKey,
                    child: CreatePostTitleWidget(
                      title: "Relevant Details",
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
