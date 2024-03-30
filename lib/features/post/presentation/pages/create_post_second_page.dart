import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/widgets/constraints_box_text_form_field.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_title_widget.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_skill/create_skills_widgets.dart';

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

  @override
  void dispose() {
    _categoryCntrl.dispose();
    _locationCntrl.dispose();
    _experienceCntrl.dispose();
    _remunerationCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        actions: [
          ActionButton(
            voidCallback: () {},
            action: 'Next',
          ),
        ],
      ),
      body: BlocListener<CreatePostBloc, CreatePostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: HomePadding(
            child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Skills and Expertise begin
                  const CreatePostSkillsWidget(),

                  ///Skills and Expertise end
                  ///
                  /// Constraints begin
                  SizedBox(height: 10.h),

                  CreatePostTitleWidget(
                    title: "Constraints",
                    children: [
                      SizedBox(height: 10.h),
                      ConstraintsBoxTextFormField(
                        controller: _locationCntrl,
                        keyboardType: TextInputType.streetAddress,
                        darkColor: _darkColor,
                        text: 'Location',
                      ),
                      SizedBox(height: 15.h),
                      ConstraintsBoxTextFormField(
                        darkColor: _darkColor,
                        controller: _experienceCntrl,
                        keyboardType: TextInputType.text,
                        text: "Experience",
                      ),
                      SizedBox(height: 15.h),
                      ConstraintsBoxTextFormField(
                        darkColor: _darkColor,
                        controller: _remunerationCntrl,
                        keyboardType: TextInputType.number,
                        text: "Remuneration",
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),

                  /// Constraints end
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

