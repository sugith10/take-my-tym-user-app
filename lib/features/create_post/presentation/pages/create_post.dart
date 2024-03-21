import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/switch_category_widget.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String dropdownValue = "Remote";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyLight.arrow_left),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: MyAppPadding.homePadding,
            left: MyAppPadding.homePadding,
          ),
          child: Column(
            children: [
              CreatePostTextField(
                hintText: 'Title',
                textStyle: Theme.of(context).textTheme.displayMedium!,
              ),
              CreatePostTextField(
                hintText: 'Start typing here...',
                textStyle: Theme.of(context).textTheme.titleLarge!,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        color: MyAppDarkColor().bottomNavigationBarBackground,
        child: Padding(
          padding: const EdgeInsets.only(
            left: MyAppPadding.homePadding,
            right: MyAppPadding.homePadding,
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.abc),
              SizedBox(width: 10),
              Icon(Icons.emoji_emotions),
              Spacer(),
              SwitchCategoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CreatePostTextField extends StatelessWidget {
  final String hintText;
  final TextStyle textStyle;

  const CreatePostTextField({
    super.key,
    required this.hintText,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: textStyle.copyWith(
          color: Colors.white.withOpacity(0.4),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      style: textStyle,
      cursorColor: Colors.white,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
    );
  }
}
