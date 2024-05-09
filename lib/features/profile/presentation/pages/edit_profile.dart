import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/left_to_right.dart';


import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_user_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/circle_profile_picture_widget.dart';
import '../../../../core/widgets/constrain_text_form_field.dart';
import '../../../../core/widgets/home_padding.dart';
import '../bloc/update_profile_bloc/update_profile_bloc.dart';



class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  static route ()=> leftToRight(const  EditProfilePage());

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileBloc profileBloc = ProfileBloc();
  final TextEditingController _nameCntrl = TextEditingController();
  final TextEditingController _aboutCntrl = TextEditingController();
  final TextEditingController _locationCntrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final style = Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppDarkColor.instance.primaryTextSoft,
      );

  @override
  void initState() {
    super.initState();
    final UserModel userModel = context.read<AppUserBloc>().userModel!;
    _nameCntrl.text = userModel.userName;
    _aboutCntrl.text = userModel.about ?? '';
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
      } else {
        // print('No image selected.');
      }
    });
  }

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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    profileBloc.add(
                          CollectUpdateDataEvent(
                            userName: _nameCntrl.text,
                            about: _aboutCntrl.text,
                            location: _locationCntrl.text,
                            image: _image,
                            userModel:
                                context.read<AppUserBloc>().userModel!,
                          ),
                        );
                  }
                },
                icon: const Icon(Icons.check_rounded)),
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
                  key: _formKey,
                  child: Column(
                    children: [
                      ConstrainTextFormField(
                        controller: _nameCntrl,
                        style: style,
                        hintText: "Name",
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill in this field";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25.h),
                      ConstrainTextFormField(
                        controller: _aboutCntrl,
                        style: style,
                        hintText: "About",
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill in this field";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25.h),
                      ConstrainTextFormField(
                        controller: _locationCntrl,
                        style: style,
                        hintText: "Location",
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill in this field";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
