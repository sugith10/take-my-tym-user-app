import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';

class AppBottomSheet {
  static void show({
    required BuildContext context,
    required List<Widget> children,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AuthPadding(
        child: Wrap(
          alignment: WrapAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
