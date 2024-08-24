import 'package:flutter/material.dart';
import 'package:take_my_tym/core/const/app_padding.dart';
import 'package:take_my_tym/core/const/app_radius.dart';

class ActionButton extends StatelessWidget {
  final String action;
  final VoidCallback callback;
  const ActionButton({
    required this.action,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPading.homePadding),
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.borderRound),
          ),
        ),
        child: Text(action),
      ),
    );
  }
}
