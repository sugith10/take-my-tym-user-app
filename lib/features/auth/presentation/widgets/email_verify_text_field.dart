import 'package:flutter/material.dart';

import '../../../../core/utils/app_radius.dart';


class EmailVerifyTextField extends StatelessWidget {
  final String onSaved;
  final TextEditingController controller;
  const EmailVerifyTextField({
    required this.controller,
    required this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 68,
      child: TextFormField(
        autofocus: true,
        onSaved: (onSaved) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        controller: controller,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
            borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
            borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
          ),
          fillColor: const Color.fromARGB(17, 255, 255, 255),
          filled: true,
        ),
        maxLength: 1,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
