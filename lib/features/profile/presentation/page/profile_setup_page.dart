import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/utils/app_assets/app_lottie.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/constrain_text_form_field.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/skills_widget/bloc/create_skill_bloc/create_skill_bloc.dart';
import '../../../../core/widgets/skills_widget/create_skills_widget.dart';
import '../../../../core/widgets/take_my_tym_info_dialog.dart';
import '../../../create_post/presentation/widgets/create_post_location_widget.dart';
import '../../../location/presentation/bloc/location_bloc.dart';
import '../../../navigation_menu/presentation/pages/home_navigation_menu.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';
import '../widget/finish_setup_button.dart';


class ProfileSetupPage extends StatefulWidget {
  final UserModel userModel;
  const ProfileSetupPage({required this.userModel, super.key});

  static route({required UserModel userModel}) => MaterialPageRoute(
        builder: (context) => ProfileSetupPage(
          userModel: userModel,
        ),
      );

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController userNameCntrl = TextEditingController();
  final TextEditingController aboutCntrl = TextEditingController();
  final TextEditingController professionCntrl = TextEditingController();
  List<dynamic>? skills;
  final LocationBloc locationBloc = LocationBloc();
  final ProfileBloc updateProfileBloc = ProfileBloc();
  final CreateSkillBloc _createSkillBloc = CreateSkillBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameCntrl.dispose();
    aboutCntrl.dispose();
    professionCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: updateProfileBloc,
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          context
              .read<AppUserBloc>()
              .add(UpdateUserModelEvent(userModel: state.userModel));

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const HomeNavigationMenu(),
            ),
            (route) => false,
          );

          TakeyMyTymDailog().show(context: context);
        }
        if (state is UpdataProfileFailState) {
          AppSnackBar.failSnackBar(context: context);
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _WelcomeMessagewidget(
                  firstName: widget.userModel.firstName,
                ),
                const Divider(),
                const SizedBox(height: 25),
                HomePadding(
                  child: Column(
                    children: [
                      CollectInfoTextField(
                        controller: userNameCntrl,
                        style: Theme.of(context).textTheme.titleSmall,
                        hintText: "User Name",
                        keyboardType: TextInputType.text,
                       
                     
                      ),
                      const SizedBox(height: 25),
                      CollectInfoTextField(
                        controller: aboutCntrl,
                        style: Theme.of(context).textTheme.titleSmall,
                        hintText: "About",
                        keyboardType: TextInputType.text,
                       
                     
                      ),
                      const SizedBox(height: 25),
                      CreatePostLocationWidget(
                        locationBloc: locationBloc,
                        gap: 12.5,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 25),
                      CollectInfoTextField(
                        controller: professionCntrl,
                        style: Theme.of(context).textTheme.titleSmall,
                        hintText: "Profession",
                        keyboardType: TextInputType.text,
                      
                     
                      ),
                      SizedBox(height: 5.h),
                      CollectItemsWidget(
                        createSkillBloc: _createSkillBloc,
                      ),
                      SizedBox(height: 35.h),
                      FinishSetupButton(
                        title: "Submit",
                        callback: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            log("${userNameCntrl.text},${aboutCntrl.text},${professionCntrl.text}");
                          }
                          final locationState = locationBloc.state;
                          if (locationState is LocationResultState) {
                            updateProfileBloc.add(
                              ProfileSetupEvent(
                                about: aboutCntrl.text,
                                userName: userNameCntrl.text,
                                profession: professionCntrl.text,
                                location: locationState.placeName,
                                latitude: locationState.latitude,
                                longitude: locationState.longitude,
                                userModel: widget.userModel,
                              ),
                            );
                          } else {
                            AppSnackBar.failSnackBar(context: context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class _WelcomeMessagewidget extends StatelessWidget {
  final String firstName;
  const _WelcomeMessagewidget({required this.firstName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //welcome message
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                Text(
                  "Welcome $firstName...",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w800, letterSpacing: .5),
                ),
                SizedBox(height: 10.h),
                Text(
                  "We are exited to on onboard you.",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
                      color: AppDarkColor.instance.primaryTextBlur),
                ),
                SizedBox(height: 3.5.h),
                Text(
                  "Before our journey begins,",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
                      color: AppDarkColor.instance.primaryTextBlur),
                ),
                SizedBox(height: 3.5.h),
                Text(
                  "Complete your profile.",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
                      color: AppDarkColor.instance.primaryTextBlur),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          //lottie asset
          Lottie.asset(
            AppLottie.welcome,
            height: 150.h,
            width: 150.h,
          ),
        ],
      ),
    );
  }
}