import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sub_page_info_widget.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AuthPadding(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                const SubPageInfoWidget(
                  title: 'Please Verify Account',
                  content:
                      "Enter the four digit code we sent to your email address to verify your new account",
                ),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 64,
                        width: 68,
                        child: TextFormField(
                          autofocus: true,
                          onSaved: (pin1) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: BorderRadius.circular(
                                    MyAppRadius.borderRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: BorderRadius.circular(
                                    MyAppRadius.borderRadius),
                              ),
                              fillColor: Color.fromARGB(17, 255, 255, 255),
                              filled: true),
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(
                        height: 64,
                        width: 68,
                        child: TextFormField(
                          autofocus: true,
                          onSaved: (pin2) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: BorderRadius.circular(
                                    MyAppRadius.borderRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: BorderRadius.circular(
                                    MyAppRadius.borderRadius),
                              ),
                              fillColor: Color.fromARGB(17, 255, 255, 255),
                              filled: true),
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(
                        height: 64,
                        width: 68,
                        child: TextFormField(
                          autofocus: true,
                          onSaved: (pin3) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: BorderRadius.circular(
                                    MyAppRadius.borderRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: BorderRadius.circular(
                                    MyAppRadius.borderRadius),
                              ),
                              fillColor: Color.fromARGB(17, 255, 255, 255),
                              filled: true),
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(
                        height: 64,
                        width: 68,
                        child: TextFormField(
                          autofocus: true,
                          onSaved: (pin4) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: BorderRadius.circular(
                                    MyAppRadius.borderRadius),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: BorderRadius.circular(
                                    MyAppRadius.borderRadius),
                              ),
                              fillColor:
                                  const Color.fromARGB(17, 255, 255, 255),
                              filled: true),
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
                SignButtonWidget(
                  title: 'Log In',
                  delay: 0,
                  duration: 0,
                  function: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
