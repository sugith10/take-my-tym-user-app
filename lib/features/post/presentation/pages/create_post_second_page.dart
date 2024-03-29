import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc.dart';

class CreatePostSecondPage extends StatefulWidget {
  const CreatePostSecondPage({super.key});

  @override
  State<CreatePostSecondPage> createState() => _CreatePostSecondPageState();
}

class _CreatePostSecondPageState extends State<CreatePostSecondPage> {
  final TextEditingController _categoryCntrl = TextEditingController();
  final MyAppDarkColor _darkColor = MyAppDarkColor();
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
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               const   CreatePostTitleWidget(title: "Skills and Expertise",),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 0.5, color: _darkColor.boxShadow),
                      borderRadius:
                          BorderRadius.circular(MyAppRadius.borderRadius),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        HomePadding(
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            controller: _categoryCntrl,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        MyAppRadius.borderRadius - 2),
                                    borderSide: BorderSide(
                                        color: _darkColor.boxShadow)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      MyAppRadius.borderRadius - 2),
                                  borderSide:
                                      BorderSide(color: _darkColor.boxShadow),
                                ),
                                hintText: "Skills",
                                hintStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                suffixIconColor: _darkColor.primaryText),
                            style: Theme.of(context).textTheme.labelLarge,
                            maxLength: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                          child: Center(
                            child: Text(
                                "Please select add atleast one item into the section,"),
                          ),
                        ),
                      ],
                    ),
                  ),
                    const   CreatePostTitleWidget(title: "Constraints"),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class CreatePostTitleWidget extends StatelessWidget {
  final String title;
  const CreatePostTitleWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h,bottom: 15.h),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
