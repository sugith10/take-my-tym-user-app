import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/left_to_right.dart';
import 'package:take_my_tym/core/widgets/app_snack_bar.dart';
import 'package:take_my_tym/core/widgets/loading_dialog.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/widgets/circle_profile_picture_widget.dart';
import '../../../../core/widgets/constrain_text_form_field.dart';
import '../../../../core/widgets/home_padding.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  static route() => leftToRight(const EditProfilePage());

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileBloc _profileBloc = ProfileBloc();
  final TextEditingController _nameCntrl = TextEditingController();
  final TextEditingController _aboutCntrl = TextEditingController();
  final TextEditingController _locationCntrl = TextEditingController();

  late final style = Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppDarkColor.instance.primaryTextSoft,
      );

  @override
  void initState() {
    super.initState();
    final UserModel userModel = context.read<AppUserBloc>().userModel!;
    _nameCntrl.text = userModel.userName;
    _aboutCntrl.text = userModel.about ?? '';
    _locationCntrl.text = userModel.location ?? "";
  }

  @override
  void dispose() {
    _nameCntrl.dispose();
    _aboutCntrl.dispose();
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
          LoadingDialog().show(context);
        }
        if (state is UpdateProfileSuccessState) {
          context
              .read<AppUserBloc>()
              .add(UpdateUserModelEvent(userModel: state.userModel));
          Navigator.pop(context);
          Navigator.pop(context);
          AppSnackBar.failSnackBar(context: context);
        }
        if (state is UpdataProfileFailState) {
          AppSnackBar.failSnackBar(context: context);
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
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _profileBloc.add(
                    CollectUpdateDataEvent(
                      userName: _nameCntrl.text,
                      about: _aboutCntrl.text,
                      location: _locationCntrl.text,
                      image: _image,
                      userModel: context.read<AppUserBloc>().userModel!,
                    ),
                  );
                },
                icon: const Icon(Icons.check_rounded),
              ),
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
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      _pickImage(ImageSource.gallery);
                    },
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
                  child: Form(
                    child: Column(
                      children: [
                        CollectInfoTextField(
                          controller: _nameCntrl,
                          style: style,
                          hintText: "Name",
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 25.h),
                        CollectInfoTextField(
                          controller: _aboutCntrl,
                          style: style,
                          hintText: "About",
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 25.h),
                        CollectInfoTextField(
                          controller: _locationCntrl,
                          style: style,
                          hintText: "Location",
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
