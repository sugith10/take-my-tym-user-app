import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/right_to_left.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/show_loading_dialog.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/location/presentation/bloc/location_bloc.dart';
import 'package:take_my_tym/features/create_post/presentation/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:take_my_tym/features/view_post/presentation/bloc/read_post_bloc/read_post_bloc.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/widgets/success_widget/success_page.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/create_post_title_widget.dart';
import 'package:take_my_tym/core/widgets/skills_widget/bloc/create_skill_bloc/create_skill_bloc.dart';
import 'package:take_my_tym/features/create_post/presentation/bloc/update_post_bloc/update_post_bloc.dart';
import 'package:take_my_tym/core/widgets/constrain_text_form_field.dart';
import 'package:take_my_tym/features/create_post/presentation/widgets/create_post_location_widget.dart';
import 'package:take_my_tym/core/widgets/skills_widget/create_skills_widget.dart';

class CreatePostSecondPage extends StatefulWidget {
  final PostModel? postModel;
  final CreatePostBloc bloc;
  const CreatePostSecondPage({required this.bloc, this.postModel, super.key});

  static route(
          {required PostModel? postModel,
          required CreatePostBloc createPostBloc}) =>
      rightToLeft(
        CreatePostSecondPage(
          bloc: createPostBloc,
          postModel: postModel,
        ),
      );
  @override
  State<CreatePostSecondPage> createState() => _CreatePostSecondPageState();
}

class _CreatePostSecondPageState extends State<CreatePostSecondPage> {
  final TextEditingController _categoryCntrl = TextEditingController();
  final TextEditingController _experienceCntrl = TextEditingController();
  final TextEditingController _remunerationCntrl = TextEditingController();
  final LocationBloc _locationBloc = LocationBloc();
  final CreateSkillBloc _createSkillBloc = CreateSkillBloc();
  List<dynamic>? skills;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.postModel != null) {
      _experienceCntrl.text = widget.postModel!.skillLevel;
      _remunerationCntrl.text = widget.postModel!.price.toString();
      skills = widget.postModel!.skills;
    }
  }

  @override
  void dispose() {
    _categoryCntrl.dispose();
    _experienceCntrl.dispose();
    _remunerationCntrl.dispose();
    _formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: MyAppDarkColor.instance.primaryTextSoft,
        );
    return MultiBlocListener(
      listeners: [
        BlocListener(
            bloc: widget.bloc,
            listener: (context, state) {
              if (state is CreatPostLoadingState) {
                ShowLoadingDialog().showLoadingIndicator(context);
              }
              if (state is CreateSecondFailState) {
                Navigator.pop(context);
                AppSnackBar.failSnackBar(
                  context: context,
                  error: state.error,
                );
              }
              if (state is CreatePostSuccessState) {
                state.refreshType
                    ? context
                        .read<GetPostsBloc>()
                        .add(GetBuyTymPostsEvent(userId: state.uid))
                    : context
                        .read<GetPostsBloc>()
                        .add(GetSellTymPostsEvent(userId: state.uid));
                Navigator.pushAndRemoveUntil(
                  context,
                  SuccessPage.route(),
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
              AppSnackBar.failSnackBar(
                context: context,
                error: state.error,
              );
            } else if (state is UpdatePostSuccessState) {
              state.refreshType
                  ? context
                      .read<GetPostsBloc>()
                      .add(GetBuyTymPostsEvent(userId: state.uid))
                  : context
                      .read<GetPostsBloc>()
                      .add(GetSellTymPostsEvent(userId: state.uid));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigationMenu(),
                ),
                (route) => false,
              );
            }
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButtonWidget(),
          actions: [
            ActionButton(
              callback: () {
                if (_formKey.currentState!.validate()) {
                  final createSkillState = _createSkillBloc.state;
                  final locationState = _locationBloc.state;
                  if (createSkillState is UpdateSkillSuccessState) {
                    if (locationState is LocationResultState) {
                      if (widget.postModel == null) {
                        widget.bloc.add(
                          CreateSecondPageEvent(
                            experience: _experienceCntrl.text,
                            location: locationState.placeName,
                            remuneration: _remunerationCntrl.text,
                            skills: createSkillState.skills,
                            latitude: locationState.latitude,
                            longitude: locationState.longitude,
                          ),
                        );
                      } else {
                        context.read<UpdatePostBloc>().add(
                              UpdateSecondPageEvent(
                                experience: _experienceCntrl.text,
                                location: locationState.placeName,
                                remuneration: _remunerationCntrl.text,
                                skills: createSkillState.skills,
                                latitude: locationState.latitude,
                                longitude: locationState.longitude,
                              ),
                            );
                      }
                    } else {
                      AppSnackBar.failSnackBar(context: context);
                    }
                  } else {
                    AppSnackBar.failSnackBar(context: context);
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
                    createSkillBloc: _createSkillBloc,
                  ),
                  SizedBox(height: 10.h),
                  Form(
                    key: _formKey,
                    child: CreatePostTitleWidget(
                      title: "Relevant Details",
                      children: [
                        SizedBox(height: 10.h),
                        CreatePostLocationWidget(
                          locationBloc: _locationBloc,
                          style: style,
                          gap: 8.h,
                        ),
                        SizedBox(height: 15.h),
                        ConstrainTextFormField(
                          controller: _experienceCntrl,
                          keyboardType: TextInputType.text,
                          hintText: "Experience",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                          style: style,
                        ),
                        SizedBox(height: 15.h),
                        ConstrainTextFormField(
                          controller: _remunerationCntrl,
                          keyboardType: TextInputType.number,
                          hintText: "Remuneration",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                          style: style,
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
