import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/bloc/app_bloc.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';

import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/constraints_text_form_field.dart';
import 'package:take_my_tym/features/profile/presentation/bloc/bloc/update_profile_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameCntrl = TextEditingController();
  final TextEditingController _aboutCntrl = TextEditingController();
  final TextEditingController _locationCntrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final AppUserModel appUserModel = context.read<AppBloc>().appUserModel!;
    _nameCntrl.text = appUserModel.firstName;
  }

  @override
  void dispose() {
    _nameCntrl.dispose();
    _aboutCntrl.dispose();
    super.dispose();
  }

  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
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
                    context.read<UpdateProfileBloc>().add(
                          CollectUpdateDataEvent(
                            userName: _nameCntrl.text,
                            about: _aboutCntrl.text,
                            location: _locationCntrl.text,
                            image: _image,
                            userModel: context.read<AppBloc>().appUserModel!
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
                    // ImagePick().getImage();
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
              SizedBox(height: 25.h),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ConstraintsTextFormField(
                        controller: _nameCntrl,
                      
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
                      ConstraintsTextFormField(
                        controller: _aboutCntrl,
                
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
                      ConstraintsTextFormField(
                        controller: _locationCntrl,
                      
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
