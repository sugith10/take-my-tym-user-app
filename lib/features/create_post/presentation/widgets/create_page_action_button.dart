import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback voidCallback;
  const ActionButton(
    {
      required this.voidCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MyAppPadding.homePadding),
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(MyAppRadius.borderRound),
            ),
          ),
        ),
        child: const Text(
          'Next',
        ),
      ),
    );
  }
}
