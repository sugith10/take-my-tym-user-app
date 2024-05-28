import 'package:flutter/material.dart';
import 'package:take_my_tym/core/theme/color/app_colors.dart';

class FeedbackTextField extends StatelessWidget {
  const FeedbackTextField({
    super.key,
  });
  final border = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(
      Radius.circular(18),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.5,
          ),
          filled: true,
          fillColor: AppDarkColor.instance.fillColor,
          hintText: ' Add a note ',
          focusedBorder: border,
          enabledBorder: border,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        minLines: 1,
        maxLines: 3,
        maxLength: 100,
        style: Theme.of(context).textTheme.labelMedium,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
