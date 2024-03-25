import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback callback;
  const SubmitButton({
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MyAppPadding.homePadding),
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        child: const Text('Submit Proposel'),
      ),
    );
  }
}
