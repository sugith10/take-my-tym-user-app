import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/create_post_text_form_field.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/location/presentation/bloc/location_bloc.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_location_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_skill/create_skills_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/finish_setup_button.dart';

class ProfileSetupCollectionPage extends StatefulWidget {
  const ProfileSetupCollectionPage({super.key});

  @override
  State<ProfileSetupCollectionPage> createState() =>
      _ProfileSetupCollectionPageState();
}

class _ProfileSetupCollectionPageState
    extends State<ProfileSetupCollectionPage> {
  final TextEditingController controller = TextEditingController();
  List<dynamic>? skills;
  final LocationBloc locationBloc = LocationBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: HomePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              // Padding(
              //   padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
              //   child: Text(
              //     "Location",
              //     style: Theme.of(context).textTheme.titleLarge,
              //   ),
              // ),
              // ConstrainTextFormField(controller: controller,hintText: ,keyboardType: ,validator: (p1) {
              // },)
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
              const Divider(),
              const SizedBox(height: 25),
              ConstrainTextFormField(
                controller: controller,
                style: Theme.of(context).textTheme.titleSmall,
                hintText: "User Name",
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
              ConstrainTextFormField(
                controller: controller,
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
                controller: controller,
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
                skills: skills,
              ),
              SizedBox(height: 35.h),
              FinishSetupButton(
                title: "Submit",
                callback: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NavigationMenu(),
                    ),
                    (route) => false,
                  );
                },
              ),
               SizedBox(height: 35.h),
            ],
          ),
        ),
      )),
    );
  }
}
