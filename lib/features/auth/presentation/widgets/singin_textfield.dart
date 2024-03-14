import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SignTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? Function(String?)? onChanged;
  final int fadeInDelay;
  final int fadeInDuration;

  const SignTextField({
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.keyboardType,
    this.fadeInDelay = 0,
    this.fadeInDuration = 0,
    this.suffixIcon,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: fadeInDelay),
      duration: Duration(milliseconds: fadeInDuration),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onTap: onTap,
        textInputAction: TextInputAction.next,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 22, 127, 19)),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
          ),
          errorText: errorMsg,
        ),
        style: Theme.of(context).textTheme.headlineSmall
      ),
    );
  }
}
