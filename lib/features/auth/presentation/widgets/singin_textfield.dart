import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SignTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obsecureText;
  final bool showSuffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;

  final int fadeInDelay;
  final int fadeInDuration;

  const SignTextField({
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.keyboardType,
    required this.showSuffixIcon,
    this.fadeInDelay = 0,
    this.fadeInDuration = 0,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    super.key,
  });

  @override
  State<SignTextField> createState() => _SignTextFieldState();
}

class _SignTextFieldState extends State<SignTextField> {
  late bool obsecureText;

  @override
  void initState() {
    super.initState();
    obsecureText = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: widget.fadeInDelay),
      duration: Duration(milliseconds: widget.fadeInDuration),
      child: TextFormField(
        cursorColor: widget.errorMsg != null ? Colors.red : Colors.black,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: obsecureText,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: widget.showSuffixIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obsecureText = !obsecureText;
                    });
                  },
                  icon: Icon(obsecureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                )
              : null,
          prefixIcon: widget.prefixIcon,
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
          ),
          errorText: widget.errorMsg,
          errorStyle: Theme.of(context).textTheme.labelSmall,
        ),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
