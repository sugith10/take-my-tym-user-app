import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class SkillsTextField extends StatelessWidget {
  final VoidCallback callback;
  final TextEditingController categoryCntrl;
  final MyAppDarkColor darkColor;
  const SkillsTextField({
    required this.callback,
    required this.categoryCntrl,
    required this.darkColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      controller: categoryCntrl,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MyAppRadius.borderRadius - 2),
          borderSide: BorderSide(color: darkColor.boxShadow),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MyAppRadius.borderRadius - 2),
          borderSide: BorderSide(color: darkColor.boxShadow),
        ),
        hintText: "Skills",
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        suffixIcon: IconButton(
          onPressed: () {
            callback();
          },
          icon: const Icon(Icons.add),
        ),
        suffixIconColor: darkColor.primaryText,
      ),
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
