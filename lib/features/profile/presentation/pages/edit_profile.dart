import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/constraints_text_form_field.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close_rounded),
        ),
        title: const Text("Edit Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.check_rounded)),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: HomePadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              const Align(
                alignment: Alignment.center,
                child: CircleProfilePicWidget(
                  height: 130,
                  width: 130,
                  image: MyAppImages.testProfile,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Change profile photo',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ConstraintsTextFormField(
                      controller: TextEditingController(),
                      darkColor: MyAppDarkColor(),
                      hintText: "Name",
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 25.h),
                    ConstraintsTextFormField(
                      controller: TextEditingController(),
                      darkColor: MyAppDarkColor(),
                      hintText: "About",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 25.h),
                    ConstraintsTextFormField(
                      controller: TextEditingController(),
                      darkColor: MyAppDarkColor(),
                      hintText: "Location",
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
