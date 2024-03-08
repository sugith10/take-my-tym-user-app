import 'package:flutter/material.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/welcome_message_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column( 
            children: [
              const SizedBox(height: 400),
              const Text("Take My Tym"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (_) => const SingInPage()));
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
