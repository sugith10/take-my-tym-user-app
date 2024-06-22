import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/utils/app_error_msg.dart';
import '../../../../core/widgets/app_snackbar/app_snack_bar.dart';
import '../../../../core/widgets/constrain_text_form_field.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/skills_widget/bloc/create_skill_bloc/create_skill_bloc.dart';
import '../../../../core/widgets/skills_widget/create_skills_widget.dart';
import '../../../../core/widgets/take_my_tym_info_dialog.dart';
import '../../../create_post/presentation/widget/create_post_location_widget.dart';
import '../../../location/presentation/bloc/location_bloc.dart';
import '../../../navigation_menu/presentation/pages/home_navigation_menu.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';
import '../widget/finish_setup_button.dart';
import '../widget/profile_setup_message.dart';

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
          AppSnackBar.failSnackBar(
            context: context,
            alert: state.alert,
          );
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
                ProfileSetupMessage(
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
                      CollectItemsWidget(createSkillBloc: _createSkillBloc),
                      SizedBox(height: 35.h),
                      FinishSetupButton(
                        title: "Submit",
                        callback: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {}
                          updateProfileBloc.add(
                            ProfileSetupEvent(
                              about: aboutCntrl.text,
                              userName: userNameCntrl.text,
                              profession: professionCntrl.text,
                              locationBloc: locationBloc,
                              userModel: widget.userModel,
                            ),
                          );
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
