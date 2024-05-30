import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/utils/app_error_msg.dart';
import '../../../../core/theme/color/app_colors.dart';
import '../../../../core/widgets/action_button.dart';
import '../../../../core/widgets/app_snackbar/app_snack_bar.dart';
import '../../../../core/widgets/circle_profile_picture_widget.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';
import '../widget/edit_profile_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileBloc _profileBloc = ProfileBloc();
  final TextEditingController userNameCntrl = TextEditingController();
  final TextEditingController aboutCntrl = TextEditingController();
  final TextEditingController locationCntrl = TextEditingController();
  final TextEditingController firstNameCntrl = TextEditingController();
  final TextEditingController lastNameCntrl = TextEditingController();

  late final style = Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppDarkColor.instance.primaryTextSoft,
      );

  @override
  void initState() {
    super.initState();
    final UserModel userModel = context.read<AppUserBloc>().userModel!;
    firstNameCntrl.text = userModel.firstName;
    lastNameCntrl.text = userModel.lastName;
    userNameCntrl.text = userModel.userName;
    aboutCntrl.text = userModel.about ?? '';
    locationCntrl.text = userModel.location ?? "";
  }

  @override
  void dispose() {
    _profileBloc.close();
    lastNameCntrl.dispose();
    firstNameCntrl.dispose();
    userNameCntrl.dispose();
    aboutCntrl.dispose();
    locationCntrl.dispose();
    super.dispose();
  }

  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    setState(() {
      if (pickedImage != null) {
        _image = pickedImage;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _profileBloc,
      listener: (context, state) {
        if (state is UpdateProfileLoadingState) {
          LoadingDialog.show(context);
        }
        if (state is UpdateProfileSuccessState) {
          context
              .read<AppUserBloc>()
              .add(UpdateUserModelEvent(userModel: state.userModel));

          LoadingDialog.hide(context, 2);
          AppSnackBar.successSnackBar(
            context: context,
            alert: AppAlert(
              alert: "Profile Update Successful",
              details: "Your profile has been updated successfully.",
            ),
          );
        }
        if (state is UpdataProfileFailState) {
          AppSnackBar.failSnackBar(context: context, alert: state.alert);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close_rounded),
          ),
          title: const Text("Edit Profile"),
          actions: [
            ActionButton(
                action: "Update",
                callback: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _profileBloc.add(
                    ProfileUpdateEvent(
                      userName: userNameCntrl.text,
                      firstName: firstNameCntrl.text,
                      lastName: lastNameCntrl.text,
                      about: aboutCntrl.text,
                      location: locationCntrl.text,
                      image: _image,
                      userModel: context.read<AppUserBloc>().userModel!,
                    ),
                  );
                }),
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
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleProfilePicWidget(
                      height: 130,
                      width: 130,
                      image: _image,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Change profile photo',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 40.h),
                HomePadding(
                  child: EditProfileForm(
                      firstNameCntrl: firstNameCntrl,
                      style: style,
                      lastNameCntrl: lastNameCntrl,
                      userNameCntrl: userNameCntrl,
                      aboutCntrl: aboutCntrl,
                      locationCntrl: locationCntrl),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
