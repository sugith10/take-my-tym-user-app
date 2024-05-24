import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/theme/color/app_colors.dart';
import 'app_title_box_widget.dart';
import 'home_padding.dart';
import 'submit_button.dart';

class ContactForm extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback callback;
  final FocusNode focusNode;
  final Widget child;
  final String title;
  final String subtitle;
  final String note;

  const ContactForm({
    required this.callback,
    required this.focusNode,
    required this.controller,
    required this.child,
    required this.title,
    required this.subtitle,
    required this.note,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: HomePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            AppTitleBoxWidget(
              title: title,
              child: SizedBox(
                height: 100.h,
                child: SingleChildScrollView(
                  child: TextField(
                    focusNode: focusNode,
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: subtitle,
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                    maxLines: null,
                    style: Theme.of(context).textTheme.labelMedium,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "Note: $note",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: SubmitButton(
                    backgroundColor: AppDarkColor.instance.success,
                    foregroundColor: AppDarkColor.instance.primaryText,
                    callback: () {
                      focusNode.unfocus();
                      callback();
                    },
                    text: 'Submit',
                    child: child,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
