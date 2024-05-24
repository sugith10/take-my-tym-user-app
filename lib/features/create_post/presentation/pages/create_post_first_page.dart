import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_post_model.dart';
import '../../../../core/navigation/screen_transitions/bottom_to_top.dart';
import '../../../../core/utils/post_types.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/home_padding.dart';
import '../bloc/create_post_bloc/create_post_bloc.dart';
import '../widgets/create_page_app_bar.dart';
import '../widgets/create_post_text_field.dart';
import '../widgets/work_type_widget.dart';
import 'create_post_second_page.dart';

class CreatePostFirstPage extends StatefulWidget {
  final PostModel? postModel;
  const CreatePostFirstPage({this.postModel, super.key});

  static route({PostModel? postModel}) =>
      bottomToTop(CreatePostFirstPage(postModel: postModel));

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
  }

  String _workType = PostType.remote;
  void getWorkType(String select) {
    _workType = select;
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

  @override
  Widget build(BuildContext context) {
    void colletInfo() {
      if (widget.postModel == null) {
        _bloc.add(
          CreateFirstPageEvent(
            userModel: context.read<AppUserBloc>().userModel!,
            tymType: _tymType,
            title: _titleController.text.trim(),
            content: _contentController.text.trim(),
            workType: _workType,
          ),
        );
      } else {
        _bloc.add(
          UpdateFirstPageEvent(
            postModel: widget.postModel!,
            title: _titleController.text,
            content: _contentController.text,
            workType: _workType,
          ),
        );
      }
    }

    return BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          if (state is CreatePostFailState) {
            AppSnackBar.failSnackBar(context: context, error: state.error);
          }
          if (state is CreateFirstSuccessState) {
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.push(
                context,
                CreatePostSecondPage.route(
                  postModel: widget.postModel,
                  createPostBloc: _bloc,
                ));
          }
        },
        child: Scaffold(
          appBar: CreatePageAppBar(
            next: true,
            actionCall: () {
              FocusManager.instance.primaryFocus?.unfocus();
              colletInfo();
            },
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
        ));
  }
}