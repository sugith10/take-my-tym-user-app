import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/post_types.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/bloc/update_post_bloc/update_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/pages/create_post_second_page.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_bottom_bar.dart';
import 'package:take_my_tym/features/post/presentation/widgets/create_post_text_field.dart';
import 'package:take_my_tym/features/post/presentation/widgets/work_type_widget.dart';

class CreatePostFirstPage extends StatefulWidget {
  final PostModel? postModel;
  const CreatePostFirstPage({this.postModel, super.key});

  @override
  State<CreatePostFirstPage> createState() => _CreatePostFirstPageState();
}

class _CreatePostFirstPageState extends State<CreatePostFirstPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  bool _tymType = true;
  final _bloc = CreatePostBloc();

  void getTymType(bool select) {
    _tymType = select;
    log("select $select, _tymType $_tymType");
  }

  String _workType = MyAppPostType.remote;
  void getWorkType(String select) {
    _workType = select;
    log("select $select workType $_workType");
  }

  @override
  void initState() {
    super.initState();
    if (widget.postModel != null) {
      _titleController.text = widget.postModel!.title;
      _contentController.text = widget.postModel!.content;
      _tymType = widget.postModel!.tymType;
      _workType = widget.postModel!.workType;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

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
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: _bloc,
          listener: (context, state) {
            if (state is CreateFirstFailState) {
              SnackBarMessenger().showSnackBar(
                context: context,
                errorMessage: state.message,
                errorDescription: state.description,
              );
            }
            if (state is CreateFirstSuccessState) {
              Navigator.push(
                  context,
                  CreatePostSecondPage.route(
                    postModel: widget.postModel,
                    createPostBloc: _bloc,
                  ));
            }
          },
        ),
        BlocListener<UpdatePostBloc, UpdatePostState>(
          listener: (context, state) {
            if (state is UpdateFirstFailState) {
              SnackBarMessenger().showSnackBar(
                context: context,
                errorMessage: state.message,
                errorDescription: state.description,
              );
            }
            if (state is UpdateFirstSuccessState) {
              log('correct positon');
              Navigator.push(
                context,
                CreatePostSecondPage.route(
                  postModel: widget.postModel,
                  createPostBloc: _bloc,
                ),
              );
            }
          },
        )
      ],
      child: Scaffold(
          appBar: AppBar(
            leading: const BackButtonWidget(),
            actions: [
              ActionButton(
                callback: () {
                  if (widget.postModel == null) {
                    _bloc.add(
                      CreateFirstPageEvent(
                        userModel: context.read<AppUserBloc>().appUserModel!,
                        tymType: _tymType,
                        title: _titleController.text.trim(),
                        content: _contentController.text.trim(),
                        workType: _workType,
                      ),
                    );
                  } else {
                    log("update section");
                    context.read<UpdatePostBloc>().add(
                          UpdateFirstPageEvent(
                            postModel: widget.postModel!,
                            title: _titleController.text,
                            content: _contentController.text,
                            workType: _workType,
                          ),
                        );
                  }
                },
                action: 'Next',
              ),
            ],
          ),
          body: HomePadding(
              child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    WorkTypeWidget(
                      function: getWorkType,
                      selectedWorkType: _workType,
                    ),
                    SizedBox(height: 8.h),
                    CreatePostTextField(
                      hintText: 'Title',
                      textStyle: Theme.of(context).textTheme.displayMedium!,
                      controller: _titleController,
                      expands: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Stack(
                        children: [
                          Container(
                            height: 150.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: MyAppDarkColor
                                  .instance.bottomNavigationBarBackground,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: _image != null
                                ? Image.file(
                                    _image!,
                                    fit: BoxFit.contain,
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Positioned(
                            top: 10,
                            right: 0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: const MaterialStatePropertyAll(
                                  CircleBorder(),
                                ),
                                minimumSize:
                                    MaterialStateProperty.all(Size(30.w, 30.h)),
                                iconSize: const MaterialStatePropertyAll(18),
                                backgroundColor: MaterialStatePropertyAll(
                                    MyAppDarkColor.instance.glassEffect),
                              ),
                              child: Icon(
                                IconlyBold.delete,
                                color: MyAppDarkColor.instance.primaryText,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: CreatePostTextField(
                        hintText: 'Start typing here...',
                        textStyle: Theme.of(context).textTheme.titleLarge!,
                        controller: _contentController,
                        expands: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          bottomNavigationBar: CreatePostBottomBar(
            getTymType: getTymType,
            postModel: widget.postModel,
            tymType: _tymType,
            pickImage: () {
              _pickImage();
            },
          )),
    );
  }
}
