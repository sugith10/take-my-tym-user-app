import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class SkillsTextField extends StatelessWidget {
    final TextEditingController categoryCntrl;
  final MyAppDarkColor darkColor;
  const SkillsTextField({
    super.key,
    required this. categoryCntrl,
    required this. darkColor,
  }) ;


  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      controller: categoryCntrl,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              MyAppRadius.borderRadius - 2),
          borderSide: BorderSide(color: darkColor.boxShadow),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              MyAppRadius.borderRadius - 2),
          borderSide: BorderSide(color: darkColor.boxShadow),
        ),
        hintText: "Skills",
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        suffixIcon: IconButton(
            onPressed: () {}, icon: const Icon(Icons.add)),
        suffixIconColor: darkColor.primaryText,
      ),
      style: Theme.of(context).textTheme.labelLarge,
 
    );
  }
}
