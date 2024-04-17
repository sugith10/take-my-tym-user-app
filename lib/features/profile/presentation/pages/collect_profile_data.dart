import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/reg_exp.dart';
import 'package:take_my_tym/core/widgets/constrain_text_form_field.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/location/presentation/bloc/location_bloc.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_location_widget.dart';
import 'package:take_my_tym/features/skills/presentation/bloc/create_skill_bloc/create_skill_bloc.dart';
import 'package:take_my_tym/features/skills/presentation/widget/create_skills_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/finish_setup_button.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController userNameCntrl = TextEditingController();
  final TextEditingController aboutCntrl = TextEditingController();
  final TextEditingController professionCntrl = TextEditingController();
  List<dynamic>? skills;
  final LocationBloc locationBloc = LocationBloc();
  final CreateSkillBloc _createSkillBloc = CreateSkillBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                  const  Padding(
                      padding:  EdgeInsets.only(left: 10),
                      child: _WelcomeMessagewidget(),
                    ),
                    Lottie.asset('asset/json/onboarding_animation (1).json',
                        height: 150.h, width: 150.h),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 25),
              HomePadding(
                child: Column(
                  children: [
                    ConstrainTextFormField(
                      controller: userNameCntrl,
                      style: Theme.of(context).textTheme.titleSmall,
                      hintText: "User Name",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in this field";
                        } else if (!nameRexExp.hasMatch(val)) {
                          return "Please enter a valid user name";
                        }
                        return null;
                      },
                      gap: 12.5.h,
                      
                    ),
                    const SizedBox(height: 25),
                    ConstrainTextFormField(
                      controller: aboutCntrl,
                      style: Theme.of(context).textTheme.titleSmall,
                      hintText: "About",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in this field";
                        }
                        return null;
                      },
                      gap: 12.5.h,
                    ),
                    const SizedBox(height: 25),
                    CreatePostLocationWidget(
                      locationBloc: locationBloc,
                      gap: 12.5.h,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 25),
                    ConstrainTextFormField(
                      controller: professionCntrl,
                      style: Theme.of(context).textTheme.titleSmall,
                      hintText: "Profession",
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in this field";
                        }
                        return null;
                      },
                      gap: 12.5.h,
                    ),
                    SizedBox(height: 5.h),
                    CreatePostSkillsWidget(
                      createSkillBloc: _createSkillBloc,
                    ),
                    SizedBox(height: 35.h),
                    FinishSetupButton(
                      title: "Submit",
                      callback: () {
                        if (_formKey.currentState!.validate()) {
                          log("${userNameCntrl.text},${aboutCntrl.text},${professionCntrl.text}");
                        }
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const NavigationMenu(),
                        //   ),
                        //   (route) => false,
                        // );
                      
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
    );
  }
}

class _WelcomeMessagewidget extends StatelessWidget {
  const _WelcomeMessagewidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25.h),
        Text(
          "Welcome sugith...",
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontWeight: FontWeight.w800, letterSpacing: .5),
        ),
        SizedBox(height: 10.h),
        Text(
          "We are exited to on onboard you.",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
              color: MyAppDarkColor.instance.primaryTextBlur),
        ),
        SizedBox(height: 3.5.h),
        Text(
          "Before our journey begins,",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
              color: MyAppDarkColor.instance.primaryTextBlur),
        ),
        SizedBox(height: 3.5.h),
        Text(
          "Complete your profile.",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
              color: MyAppDarkColor.instance.primaryTextBlur),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
