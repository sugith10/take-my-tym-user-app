import 'package:flutter/material.dart';

class CreatePostTextField extends StatelessWidget {
  final String hintText;
  final TextStyle textStyle;
  final TextEditingController controller;

  const CreatePostTextField({
    required this.controller,
    required this.hintText,
    required this.textStyle,
      super.key,
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
      controller: controller,
    );
  }
}
