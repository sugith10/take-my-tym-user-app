import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/util/reg_exp.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sigin_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/singin_textfield.dart';
import 'package:take_my_tym/features/home/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _errorMsg;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController;
    passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
       
        if (state is LoadingState) {}
        if(state is SignedInState){
          Navigator.push(context, 
          MaterialPageRoute(builder: 
          (context)=> const HomePage())
          );
        }
      },
      
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  // const SizedBox(height: 400),
                  const SignIn(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: SignTextField(
                            controller: emailController,
                            hintText: "Email",
                            obsecureText: false,
                            errorMsg: _errorMsg,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.mail_outline_rounded),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please fill in this Field";
                              } else if (!emailRexExp.hasMatch(val)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: SignTextField(
                            controller: passwordController,
                            hintText: "Password",
                            obsecureText: true,
                            errorMsg: _errorMsg,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.password_rounded),
                            validator: (val) {
                              if (val!.isEmpty) {
                                log(val);
                                return "Please fill in this Field.";
                              } else if (val.length < 6) {
                                return "Password should be at least 6 characters long.";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                log(emailController.text);
                                log(passwordController.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomePage()));
                              } else {
                                log("not validated");
                              }
                            },
                            child: const Text("Submit"))
                      ],
                    ),
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
